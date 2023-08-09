import 'package:algoretailkobymashiach/models/tasks_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState()) {
    on<LoadTasksEvent>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const TasksLoadedState(tasks: <Tasks>[]));
    });

    on<LoadedTasksEvent>((event, emit) {
      if (state is TasksLoadedState) {
        final state = this.state as TasksLoadedState;
        emit(TasksLoadedState(tasks: List.from(state.tasks)..add(event.tasks)));
      }
    });
  }
}
