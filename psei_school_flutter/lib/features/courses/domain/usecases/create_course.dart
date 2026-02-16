import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';

class CreateCourseUseCase implements Usecase<Course, CreateCourseParams> {
  final CourseRepository repo;
  CreateCourseUseCase(this.repo);

  @override
  Future<Either<Failure, Course>> call(CreateCourseParams params) {
    return repo.createCourse(params.course);
  }
}

class CreateCourseParams {
  final Course course;
  CreateCourseParams(this.course);
}

