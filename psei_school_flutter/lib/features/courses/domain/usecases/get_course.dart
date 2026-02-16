import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';

class GetCourseUseCase implements Usecase<Course, GetCourseParams> {
  final CourseRepository repo;
  GetCourseUseCase(this.repo);

  @override
  Future<Either<Failure, Course>> call(GetCourseParams params) {
    return repo.getCourseById(params.id);
  }
}

class GetCourseParams {
  final int id;
  GetCourseParams(this.id);
}

