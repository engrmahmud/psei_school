import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';

class SearchStudentsUseCase implements Usecase<List<Student>, SearchStudentParams> {
  final StudentRepository repo;
  SearchStudentsUseCase(this.repo);

  @override
  Future<Either<Failure, List<Student>>> call(SearchStudentParams params) {
    return repo.searchStudents(
      name: params.name,
      id: params.id,
      roll: params.roll,
      registration: params.registration,
      studentClass: params.studentClass,
    );
  }
}

class SearchStudentParams {
  final String? name;
  final int? id;
  final String? roll;
  final String? registration;
  final String? studentClass;

  SearchStudentParams({
    this.name,
    this.id,
    this.roll,
    this.registration,
    this.studentClass,
  });
}

