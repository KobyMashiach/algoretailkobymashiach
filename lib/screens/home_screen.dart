import 'dart:convert';

import 'package:algoretailkobymashiach/data/fix_strings.dart';
import 'package:algoretailkobymashiach/design/appbar.dart';
import 'package:algoretailkobymashiach/design/design_lines.dart';
import 'package:algoretailkobymashiach/screens/second_page.dart';
import 'package:algoretailkobymashiach/widgets/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _tasks = [];
  String _searchQuery = "";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/data/tasks.json');
    final data = await json.decode(response);
    setState(() {
      _tasks = data["tasks"];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DesignLines appDesign = DesignLines();
    FixString fixString = FixString();

    List filteredItems = _tasks
        .where((task) => task['task_name'].toString().contains(_searchQuery))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: appAppbar(title: "משימות"),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AppNavigator()
              .push(context, TaskScreen(taskId: _tasks[0]["task_id"])),
          child: Column(
            children: [
              // -----------------search-----------------
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 236, 236, 236), // Container color
                    borderRadius: BorderRadius.circular(20.0), // Radius value
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.search, color: Colors.black38),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.black54),
                          controller: TextEditingController.fromValue(
                            TextEditingValue(
                                text: _searchQuery,
                                selection: TextSelection(
                                  baseOffset: _searchQuery.length,
                                  extentOffset: _searchQuery.length,
                                )),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'חיפוש',
                            hintStyle: TextStyle(color: Colors.black38),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => setState(() {
                            _searchQuery = value;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // -----------------search-----------------
              Expanded(
                  child: filteredItems.isEmpty
                      ? const Text("לא נמצאו תוצאות")
                      : ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            switch (filteredItems[index]["task_name"]) {
                              case "מילוי עגלה":
                                return Column(
                                  children: [
                                    appDesign.appDivider(),
                                    appDesign.cartFilling(
                                      appDesign,
                                      filteredItems[index]["task_name"],
                                      fixString.cartFillingArrayTitle(
                                          filteredItems[index]["array"]
                                              .toString()),
                                      fixString.cartFillingArrayCount(
                                          filteredItems[index]["array"]
                                              .toString()),
                                    )
                                  ],
                                );
                              case "פיזור עגלה":
                                return Column(
                                  children: [
                                    appDesign.appDivider(),
                                    appDesign.cartDistribution(
                                        context,
                                        appDesign,
                                        filteredItems[index]["task_name"],
                                        filteredItems[index]["cart_number"],
                                        filteredItems[index]["urgency"],
                                        filteredItems[index]["task_id"])
                                  ],
                                );
                              case "ספירת מלאי":
                                return Column(
                                  children: [
                                    appDesign.appDivider(),
                                    appDesign.inventoryCount(
                                        context,
                                        appDesign,
                                        filteredItems[index]["task_name"],
                                        filteredItems[index]["time"],
                                        filteredItems[index]["task_id"])
                                  ],
                                );
                            }
                            return null;
                          }))
            ],
          ),
        ),
      ),
    );
  }
}
