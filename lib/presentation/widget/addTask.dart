import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:date_format/date_format.dart';
import 'package:task_manager/application/task_bloc.dart';

import 'package:task_manager/domain/core/func.dart';
import 'package:task_manager/domain/utils/color_utils.dart';
import 'package:task_manager/domain/utils/enums.dart';
import 'package:task_manager/infastructure/model/task.model.dart';


class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        // if (state.isSuccess == true) {
        //   print(state.isSuccess);
        //   Navigator.pop(context);
        // }
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const Text(
                  "Add New Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  key: const Key("addTitleField"),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      labelText: 'Title',
                      errorStyle:
                          const TextStyle(color: Colors.black, fontSize: 15)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter task title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 5,
                  key: const Key("addDescriptionField"),
                  controller: descriptionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      labelText: 'Description',
                      errorStyle:
                          const TextStyle(color: Colors.black, fontSize: 15)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Description";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 33,
                ),
                SizedBox(
                  width: ResponsiveWrapper.of(context).scaledWidth,
                  child: Visibility(
                    visible: !state.isLoading,
                    replacement: const SpinKitFadingFour(color: Colors.black),
                    child: ElevatedButton(
                      key: const Key("addButton"),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final date = formatDate(
                              DateTime.now(), [yyyy, '-', mm, '-', dd]);

                          final task = TaskModel(
                              id: generateId(),
                              title: titleController.text.trim(),
                              description: descriptionController.text.trim(),
                              date: date,
                              status: Status.Pending.name);
                          context.read<TaskBloc>().add(AddTask(task: task));
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'Add Task',
                          style: TextStyle(
                              color: textPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
