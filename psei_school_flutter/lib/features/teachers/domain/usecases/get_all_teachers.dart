import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';

class GetAllTeachersUseCase implements Usecase<List<Teacher>, NoParams> {
  final TeacherRepository repo;
  GetAllTeachersUseCase(this.repo);

  @override
  Future<Either<Failure, List<Teacher>>> call(NoParams params) {
    return repo.getAllTeachers();
  }
}

