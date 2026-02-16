import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repositories/student_repository.dart';

class UpdateStudentUseCase implements Usecase<Student, UpdateStudentParams> {
  final StudentRepository repo;
  UpdateStudentUseCase(this.repo);

  @override
  Future<Either<Failure, Student>> call(UpdateStudentParams params) {
    return repo.updateStudent(params.id, params.student);
  }
}

class UpdateStudentParams {
  final int id;
  final Student student;
  UpdateStudentParams(this.id, this.student);
}
