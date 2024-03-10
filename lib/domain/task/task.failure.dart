import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.failure.freezed.dart';

@freezed
abstract class TaskFailure with _$TaskFailure {
  const factory TaskFailure.fieldRequired() = _FieldRequired;
  const factory TaskFailure.taskNotFound() = _TaskNotFound;
  const factory TaskFailure.failedToDelete() = _TailedToDelete;
  const factory TaskFailure.failedToUpdate() = _FailedToUpdate;
  const factory TaskFailure.failedToAddTask() = _FailedToTask;
  const factory TaskFailure.localServiceError() = _LocalServiceError;
}
