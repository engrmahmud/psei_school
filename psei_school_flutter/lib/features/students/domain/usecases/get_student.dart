import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';

class GetStudentUseCase implements Usecase<Student, GetStudentParams> {
  final StudentRepository repo;
  GetStudentUseCase(this.repo);

  @override
  Future<Either<Failure, Student>> call(GetStudentParams params) {
    return repo.getStudentById(params.id);
  }
}

class GetStudentParams {
  final int id;
  GetStudentParams(this.id);
}
