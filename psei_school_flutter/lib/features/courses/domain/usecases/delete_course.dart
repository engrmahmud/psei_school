import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';

class DeleteCourseUseCase implements Usecase<bool, DeleteCourseParams> {
  final CourseRepository repo;
  DeleteCourseUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(DeleteCourseParams params) {
    return repo.deleteCourse(params.id);
  }
}

class DeleteCourseParams {
  final int id;
  DeleteCourseParams(this.id);
}

