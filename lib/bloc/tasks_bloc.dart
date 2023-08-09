import 'package:algoretailkobymashiach/models/tasks_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TasksLoadedState());
    });

    on<LoadedTasksEvent>((event, emit) {
      if (state is TasksLoadedState) {
        emit(TasksLoadedState());
      }
    });
  }
}
