part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksInitialState extends TasksState {}

class TasksLoadedState extends TasksState {
  final List<Tasks> tasks;
  const TasksLoadedState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}
