import 'package:flutter/material.dart';
import 'package:task_manager/infastructure/model/task.model.dart';
import 'package:task_manager/presentation/widget/taskCard.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key, required this.task});
  final List<TaskModel> task;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: TaskCardComponent(
              task: task[index],
              index: index,
            )));
  }
}
