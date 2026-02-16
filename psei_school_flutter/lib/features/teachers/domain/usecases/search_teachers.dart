import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';

class SearchTeachersUseCase implements Usecase<List<Teacher>, SearchTeacherParams> {
  final TeacherRepository repo;
  SearchTeachersUseCase(this.repo);

  @override
  Future<Either<Failure, List<Teacher>>> call(SearchTeacherParams params) {
    return repo.searchTeachers(
      name: params.name,
      id: params.id,
      department: params.department,
      designation: params.designation,
    );
  }
}

class SearchTeacherParams {
  final String? name;
  final int? id;
  final String? department;
  final String? designation;

  SearchTeacherParams({
    this.name,
    this.id,
    this.department,
    this.designation,
  });
}

