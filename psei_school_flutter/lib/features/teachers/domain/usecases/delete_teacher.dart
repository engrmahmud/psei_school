import 'package:fpdart/fpdart.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';

class DeleteTeacherUseCase implements Usecase<bool, DeleteTeacherParams> {
  final TeacherRepository repo;
  DeleteTeacherUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(DeleteTeacherParams params) {
    return repo.deleteTeacher(params.id);
  }
}

class DeleteTeacherParams {
  final int id;
  DeleteTeacherParams(this.id);
}

