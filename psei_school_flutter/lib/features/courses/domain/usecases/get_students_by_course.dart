import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/student_course_repository.dart';

class GetStudentsByCourseParams {
  final int courseId;
  GetStudentsByCourseParams({required this.courseId});
}

class GetStudentsByCourseUseCase implements Usecase<List<Student>, GetStudentsByCourseParams> {
  final StudentCourseRepository repo;
  GetStudentsByCourseUseCase(this.repo);

  @override
  Future<Either<Failure, List<Student>>> call(GetStudentsByCourseParams params) {
    return repo.getStudentsByCourse(params.courseId);
  }
}

