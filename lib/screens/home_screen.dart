import 'dart:convert';

import 'package:algoretailkobymashiach/data/fix_strings.dart';
import 'package:algoretailkobymashiach/design/appbar.dart';
import 'package:algoretailkobymashiach/design/design_lines.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _tasks = [];
  final TextEditingController _searchController = TextEditingController();

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

    return SafeArea(
      child: Scaffold(
        appBar: appAppbar(title: "משימות"),
        body: Column(
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
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'חיפוש',
                          hintStyle: TextStyle(color: Colors.black38),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => setState(
                            () {}), // refresh the list when search query changes
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // -----------------search-----------------
            Expanded(
                child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      switch (_tasks[index]["task_name"]) {
                        case "מילוי עגלה":
                          return Column(
                            children: [
                              appDesign.appDivider(),
                              appDesign.cartFilling(
                                appDesign,
                                _tasks[index]["task_name"],
                                fixString.cartFillingArrayTitle(
                                    _tasks[index]["array"].toString()),
                                fixString.cartFillingArrayCount(
                                    _tasks[index]["array"].toString()),
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
                                _tasks[index]["task_name"],
                                _tasks[index]["cart_number"],
                                _tasks[index]["urgency"],
                              )
                            ],
                          );
                        case "ספירת מלאי":
                          return Column(
                            children: [
                              appDesign.appDivider(),
                              appDesign.inventoryCount(
                                  appDesign,
                                  _tasks[index]["task_name"],
                                  _tasks[index]["time"])
                            ],
                          );
                      }
                      return null;
                    }))
          ],
        ),
      ),
    );
  }
}
