import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/teacher_course_repository.dart';

class AssignTeacherToCourseParams {
  final int teacherId;
  final int courseId;
  final String? role;
  AssignTeacherToCourseParams({
    required this.teacherId,
    required this.courseId,
    this.role,
  });
}

class AssignTeacherToCourseUseCase implements Usecase<TeacherCourse, AssignTeacherToCourseParams> {
  final TeacherCourseRepository repo;
  AssignTeacherToCourseUseCase(this.repo);

  @override
  Future<Either<Failure, TeacherCourse>> call(AssignTeacherToCourseParams params) {
    return repo.assignTeacherToCourse(
      teacherId: params.teacherId,
      courseId: params.courseId,
      role: params.role,
    );
  }
}

