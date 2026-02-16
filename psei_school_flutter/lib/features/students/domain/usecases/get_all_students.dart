import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';

class GetAllStudentsUseCase implements Usecase<List<Student>, NoParams> {
  final StudentRepository repo;
  GetAllStudentsUseCase(this.repo);

  @override
  Future<Either<Failure, List<Student>>> call(NoParams params) {
    return repo.getAllStudents();
  }
}
