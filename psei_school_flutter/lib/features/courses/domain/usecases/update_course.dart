import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';

class UpdateCourseUseCase implements Usecase<Course, UpdateCourseParams> {
  final CourseRepository repo;
  UpdateCourseUseCase(this.repo);

  @override
  Future<Either<Failure, Course>> call(UpdateCourseParams params) {
    return repo.updateCourse(params.id, params.course);
  }
}

class UpdateCourseParams {
  final int id;
  final Course course;
  UpdateCourseParams(this.id, this.course);
}

