import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/teacher_course_repository.dart';

class GetTeachersByCourseParams {
  final int courseId;
  GetTeachersByCourseParams({required this.courseId});
}

class GetTeachersByCourseUseCase implements Usecase<List<Teacher>, GetTeachersByCourseParams> {
  final TeacherCourseRepository repo;
  GetTeachersByCourseUseCase(this.repo);

  @override
  Future<Either<Failure, List<Teacher>>> call(GetTeachersByCourseParams params) {
    return repo.getTeachersByCourse(params.courseId);
  }
}

