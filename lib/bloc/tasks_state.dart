part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksInitialState extends TasksState {}

class TasksLoadedState extends TasksState {
  List<Tasks> tasks = [
    Tasks(taskId: '1', taskName: 'check1'),
    Tasks(taskId: '2', taskName: 'check2'),
    Tasks(taskId: '3', taskName: 'check3')
  ];

  List<dynamic> _loadedTasks = [Tasks(taskId: '1')];

  TasksLoadedState({data}) {
    _loadedTasks = data ?? [];
  }

  List<Object> get props => [_loadedTasks];
}
