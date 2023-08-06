import 'package:algoretailkobymashiach/design/appbar.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appAppbar(title: "מסך 2"),
      body: Center(
          child: Text(
        "מס' משימה $taskId",
        style: const TextStyle(fontSize: 20),
      )),
    ));
  }
}
