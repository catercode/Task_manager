import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_manager/application/task_bloc.dart';
import 'package:task_manager/domain/utils/color_utils.dart';
import 'package:task_manager/infastructure/model/task.model.dart';

class TaskCardComponent extends StatelessWidget {
  const TaskCardComponent({super.key, required this.task, required this.index});
  final TaskModel task;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 1, 1, 1).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: textPrimaryColor,
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                        color: textSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(
                          color: textPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      task.date,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Visibility(
                  visible: state.selectedIndex != index,
                  replacement: const SpinKitFadingFour(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  child: IconButton(
                      onPressed: () {
                        context
                            .read<TaskBloc>()
                            .add(DeleteTask(task: task, selectedIndex: index));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
