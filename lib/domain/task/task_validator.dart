import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'task.failure.dart';


//@singleton
class Validator {
    Either<TaskFailure, String> validateInputField(String input) {
    if (input.isNotEmpty) {
      return Right(input);
    } else {
      return const Left(TaskFailure.fieldRequired());
    }
  }
}
