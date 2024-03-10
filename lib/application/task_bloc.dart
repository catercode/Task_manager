import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:task_manager/domain/core/config/injection.dart';
import 'package:task_manager/domain/task/task.facede.dart';
import 'package:task_manager/domain/task/task.failure.dart';
import 'package:task_manager/infastructure/model/task.model.dart';

part 'task_event.dart';
part 'task_bloc_state.dart';

class TaskBloc extends Bloc<TaskListEvent, TaskState> {
  TaskBloc() : super(TaskState(task: [])) {
    on<GetAllTask>(_getAllTask);
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
  }
  final _iTaskFacade = getIt<ITaskFacade>();

  void _getAllTask(GetAllTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoadingTask: true));
    await Future.delayed(const Duration(seconds: 5));
    (await _iTaskFacade.getAllTask()).fold(
        (failure) => emit(
            state.copyWith(isLoadingTask: false, taskFailure: Some(failure))),
        (listOfTask) {
      emit(state.copyWith(isLoadingTask: false, task: listOfTask));
    });
  }

  void _addTask(AddTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));

    await Future.delayed(const Duration(seconds: 2));

    final List<TaskModel> updatedTasks = [...?state.task, event.task];

    (await _iTaskFacade.addTask(task: event.task)).fold(
      (failure) {
        emit(state.copyWith(
            isSuccess: false, taskFailure: Some(failure), isLoading: false));
      },
      (isSuccess) {
        emit(state.copyWith(
            task: updatedTasks, isSuccess: true, isLoading: false));
      },
    );
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
    await Future.delayed(const Duration(seconds: 2));
    (await _iTaskFacade.deleteTask(id: event.task.id)).fold(
      (failure) {
        emit(state.copyWith(selectedIndex: -1, taskFailure: Some(failure)));
      },
      (isDeleted) {
        if (isDeleted) {
          state.task!.removeAt(event.selectedIndex);

          emit(state.copyWith(
              selectedIndex: -1, isSuccess: true, task: state.task));
        } else {
          emit(state.copyWith(
              selectedIndex: -1,
              isLoading: false,
              taskFailure: const Some(TaskFailure.failedToDelete())));
        }
      },
    );
  }
}
