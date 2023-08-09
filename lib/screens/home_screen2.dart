import 'package:algoretailkobymashiach/bloc/tasks_bloc.dart';
import 'package:algoretailkobymashiach/design/appbar.dart';
import 'package:algoretailkobymashiach/models/tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appAppbar(title: 'בדיקה'),
      body: Center(
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            if (state is TasksInitialState) {
              return const CircularProgressIndicator();
            }
            if (state is TasksLoadedState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('${state.tasks.length}')],
              );
            }
            return const Text('wrong');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<TasksBloc>().add(LoadedTasksEvent(Tasks(taskId: '1')));
      }),
    ));
  }
}
