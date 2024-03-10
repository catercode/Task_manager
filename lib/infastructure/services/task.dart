import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/domain/task/task.failure.dart';
import 'package:task_manager/infastructure/model/task.model.dart';

class HiveService {
  Future<Either<TaskFailure, bool>> addTask({required TaskModel task}) async {
    try {
      final taskData = jsonEncode(task.toJson());
      var box = await Hive.openBox('task');

      await box.add(taskData);
      await box.close();
      log("Success:");
      return const Right(true);
    } catch (e) {
      log("Error adding task: $e");
      return const Left(TaskFailure.failedToAddTask());
    }
  }

  Future<Either<TaskFailure, List<TaskModel>>> getAllTask() async {
    try {
      var box = await Hive.openBox('task');
      List<TaskModel> tasks = [];

      if (box.isNotEmpty) {
        for (var i = 0; i < box.length; i++) {
          final taskData = box.getAt(i);

          final Map<String, dynamic> taskJsonMap = jsonDecode(taskData);
          final task = TaskModel.fromJson(taskJsonMap);
          tasks.add(task);

          log("Data: $tasks");
        }

        return Right(tasks);
      } else {
        log("[Data]: $tasks");
        return const Right([]);
      }
    } catch (e) {
      log("Error getting task: $e");

      return const Left(TaskFailure.localServiceError());
    }
  }

  Future<Either<TaskFailure, bool>> deleteTask({required String taskId}) async {
    try {
      var box = await Hive.openBox('task');
      final index = box.values.toList().indexWhere((taskData) {
        final Map<String, dynamic> taskJsonMap = jsonDecode(taskData);
        final task = TaskModel.fromJson(taskJsonMap);

        return task.id == taskId;
      });

      if (index != -1) {
        await box.deleteAt(index);
      }
      await box.close();
      return const Right(true);
    } catch (e) {
      // Handle errors if any
      print("Error deleting task: $e");
      return const Left(TaskFailure.failedToDelete());
    }
  }
}
