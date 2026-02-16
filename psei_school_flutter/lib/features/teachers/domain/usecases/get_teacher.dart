import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';

class GetTeacherUseCase implements Usecase<Teacher, GetTeacherParams> {
  final TeacherRepository repo;
  GetTeacherUseCase(this.repo);

  @override
  Future<Either<Failure, Teacher>> call(GetTeacherParams params) {
    return repo.getTeacherById(params.id);
  }
}

class GetTeacherParams {
  final int id;
  GetTeacherParams(this.id);
}

