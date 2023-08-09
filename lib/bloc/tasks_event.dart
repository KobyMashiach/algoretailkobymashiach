part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TasksEvent {}

//! try add new event from json upload one by one

class LoadedTasksEvent extends TasksEvent {
  final Tasks tasks;

  const LoadedTasksEvent(this.tasks);

  @override
  List<Object> get props => [tasks];
}
