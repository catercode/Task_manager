import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_manager/application/task_bloc.dart';
import 'package:task_manager/domain/utils/color_utils.dart';
import 'package:task_manager/presentation/widget/addTask.dart';
import 'package:task_manager/presentation/widget/build_text_components.dart';
import 'package:task_manager/presentation/widget/custom.modal.sheet.dart';
import 'package:task_manager/presentation/widget/taskListComponent.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TaskBloc>().add(GetAllTask());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: textSecondaryColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            useRootNavigator: true,
            enableDrag: true,
            isDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return const CustomModalSheet(height: 1.5, main: AddTaskForm());
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: const Text(
          'Task Manager',
          style: TextStyle(
              fontSize: 30,
              color: textSecondaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          
          return !state.isLoadingTask
              ? state.task!.isNotEmpty
                  ? TaskListComponent(
                      task: state.task!,
                    )
                  : const Center(
                      child: NormalTextWidget(
                        text: "No Task Found",
                        fontSize: 22,
                        color: textSecondaryColor,
                      ),
                    )
              : const SpinKitFadingFour(
                  color: Color.fromARGB(255, 255, 255, 255));
        },
      ),
    );
  }
}
