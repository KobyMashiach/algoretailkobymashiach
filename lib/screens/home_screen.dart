import 'dart:convert';

import 'package:algoretailkobymashiach/design/appbar.dart';
import 'package:algoretailkobymashiach/design/design_lines.dart';
import 'package:algoretailkobymashiach/design/show_tasks.dart';
import 'package:algoretailkobymashiach/widgets/appToasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _tasks = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/data/tasks.json');
    final data = await json.decode(response);
    setState(() {
      _tasks = data["tasks"];
    });
  }

  @override
  Widget build(BuildContext context) {
    DesignLines appDesign = DesignLines();
    ShowTasks showTasks = ShowTasks();

    return SafeArea(
      child: Scaffold(
        appBar: appAppbar(title: "משימות"),
        body: Column(
          children: [
            // -----------------search-----------------
            const Divider(
              height: 20,
              thickness: 2,
            ),
            const Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.search),
                Text("   חיפוש"),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
            ),
            // -----------------search-----------------
            appDesign.appDivider(),
            _tasks.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) {
                          switch (_tasks[index]["task_name"]) {
                            case "מילוי עגלה":
                              return showTasks.cartFilling(appDesign);
                            case "פיזור עגלה":
                              return showTasks.cartDistribution(appDesign);
                            case "ספירת מלאי":
                              return showTasks.inventoryCount(appDesign);
                          }
                        }))
                : ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: const Center(
                      child: Text("Load Json"),
                    ))
          ],
        ),
      ),
    );
  }
}
