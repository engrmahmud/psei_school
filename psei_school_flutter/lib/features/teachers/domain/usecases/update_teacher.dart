import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';

class UpdateTeacherUseCase implements Usecase<Teacher, UpdateTeacherParams> {
  final TeacherRepository repo;
  UpdateTeacherUseCase(this.repo);

  @override
  Future<Either<Failure, Teacher>> call(UpdateTeacherParams params) {
    return repo.updateTeacher(params.id, params.teacher);
  }
}

class UpdateTeacherParams {
  final int id;
  final Teacher teacher;
  UpdateTeacherParams(this.id, this.teacher);
}

