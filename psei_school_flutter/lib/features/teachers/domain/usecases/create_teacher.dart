import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';

class CreateTeacherUseCase implements Usecase<Teacher, CreateTeacherParams> {
  final TeacherRepository repo;
  CreateTeacherUseCase(this.repo);

  @override
  Future<Either<Failure, Teacher>> call(CreateTeacherParams params) {
    return repo.createTeacher(params.teacher);
  }
}

class CreateTeacherParams {
  final Teacher teacher;
  CreateTeacherParams(this.teacher);
}

