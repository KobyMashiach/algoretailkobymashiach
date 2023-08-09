import 'package:equatable/equatable.dart';

class TasksModel {
  List<Tasks>? tasks;

  TasksModel({this.tasks});

  TasksModel.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks extends Equatable {
  String? taskId;
  String? taskName;
  List<String>? taskArray;
  String? cartNumber;
  String? urgency;
  String? time;

  Tasks(
      {this.taskId,
      this.taskName,
      this.taskArray,
      this.cartNumber,
      this.urgency,
      this.time});

  Tasks.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    taskName = json['task_name'];
    taskArray = json['array'];
    cartNumber = json['cart_number'];
    urgency = json['urgency'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task_id'] = taskId;
    data['task_name'] = taskName;
    data['array'] = taskArray;
    data['cart_number'] = cartNumber;
    data['urgency'] = urgency;
    data['time'] = time;
    return data;
  }

  @override
  List<Object?> get props =>
      [taskId, taskName, taskArray, cartNumber, urgency, time];

  static List<Tasks> tasks = [Tasks(taskId: '1', taskName: 'check')];
}
