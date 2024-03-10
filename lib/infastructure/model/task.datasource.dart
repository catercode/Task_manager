import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/task/task.facede.dart';
import 'package:task_manager/domain/task/task.failure.dart';
import 'package:task_manager/infastructure/model/task.model.dart';
import 'package:task_manager/infastructure/services/task.dart';

@Injectable(as: ITaskFacade)
class TaskDataSource implements ITaskFacade {
  final HiveService _hiveService = HiveService();
  @override
  Future<Either<TaskFailure, bool>> addTask({required TaskModel task}) async {
    final failureOrTask = await _hiveService.addTask(task: task);
    return failureOrTask.fold(
        (failure) => Left(failure), (tasK) => Right(tasK));
  }

  @override
  Future<Either<TaskFailure, bool>> deleteTask({required String id}) async {
    final failureOrTask = await _hiveService.deleteTask(taskId: id);
    return failureOrTask.fold(
        (failure) => Left(failure), (task) => Right(task));
  }

  @override
  Future<Either<TaskFailure, List<TaskModel>>> getAllTask() async {
    final failureOrTask = await _hiveService.getAllTask();
    return failureOrTask.fold(
        (failure) => Left(failure), (listOfTask) => Right(listOfTask));
  }

 
}
