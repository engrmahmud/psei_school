import 'package:fpdart/fpdart.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';

class DeleteStudentUseCase implements Usecase<void, DeleteStudentParams> {
  final StudentRepository repo;
  DeleteStudentUseCase(this.repo);

  @override
  Future<Either<Failure, void>> call(DeleteStudentParams params) {
    return repo.deleteStudent(params.id);
  }
}

class DeleteStudentParams {
  final int id;
  DeleteStudentParams(this.id);
}
