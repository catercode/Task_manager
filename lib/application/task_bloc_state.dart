part of 'task_bloc.dart';

class TaskState {
  final List<TaskModel>? task;
  final Option<TaskFailure> taskFailure;
  final bool isLoading;
  final bool isLoadingTask;
  final bool isSuccess;
  final int selectedIndex;
  final bool isDeleting;

  TaskState({
    this.task,
    this.isLoading = false,
    this.isDeleting = false,
    this.isSuccess = false,
     this.isLoadingTask = false,
    this.taskFailure = const None(),
    this.selectedIndex = -1,
  });

  TaskState copyWith(
      {List<TaskModel>? task,
      bool? isLoading,
      bool? isSuccess, bool? isLoadingTask,
      Option<TaskFailure>? taskFailure,
      String? date,
       
      int? selectedIndex}) {
    return TaskState(
        task: task ?? this.task,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess, 
         isLoadingTask: isLoadingTask ?? this.isLoadingTask,
        taskFailure: taskFailure ?? this.taskFailure,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
