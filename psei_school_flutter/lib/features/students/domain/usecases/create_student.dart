import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';

class CreateStudentUseCase implements Usecase<Student, CreateStudentParams> {
  final StudentRepository repo;
  CreateStudentUseCase(this.repo);

  @override
  Future<Either<Failure, Student>> call(CreateStudentParams params) {
    return repo.createStudent(params.student);
  }
}

class CreateStudentParams {
  final Student student;
  CreateStudentParams(this.student);
} 