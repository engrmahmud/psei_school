import 'package:fpdart/fpdart.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/teacher_course_repository.dart';

class UnassignTeacherFromCourseParams {
  final int teacherId;
  final int courseId;
  UnassignTeacherFromCourseParams({required this.teacherId, required this.courseId});
}

class UnassignTeacherFromCourseUseCase implements Usecase<bool, UnassignTeacherFromCourseParams> {
  final TeacherCourseRepository repo;
  UnassignTeacherFromCourseUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(UnassignTeacherFromCourseParams params) {
    return repo.unassignTeacherFromCourse(
      teacherId: params.teacherId,
      courseId: params.courseId,
    );
  }
}

