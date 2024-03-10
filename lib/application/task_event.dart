part of 'task_bloc.dart';

abstract class TaskListEvent {}

class AddTask extends TaskListEvent {
  final TaskModel task;

  AddTask({required this.task});
}

class DeleteTask extends TaskListEvent {
  final TaskModel task;
  final int selectedIndex;


  DeleteTask( {required this.task, required this.selectedIndex});
}

class GetAllTask extends TaskListEvent {}

class ToggleTaskStatus extends TaskListEvent {
  final bool isLoading;

  ToggleTaskStatus({required this.isLoading});
}



