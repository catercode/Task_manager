import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/infastructure/model/task.model.dart';

import 'task.failure.dart';


abstract class ITaskFacade {

  Future<Either<TaskFailure, List<TaskModel>>> getAllTask();
  Future<Either<TaskFailure, bool>> deleteTask({required String id});
  Future<Either<TaskFailure, bool>> addTask({required TaskModel task});

}
