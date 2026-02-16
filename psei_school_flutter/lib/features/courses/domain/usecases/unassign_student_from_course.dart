import 'package:fpdart/fpdart.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/student_course_repository.dart';

class UnassignStudentFromCourseParams {
  final int studentId;
  final int courseId;
  UnassignStudentFromCourseParams({required this.studentId, required this.courseId});
}

class UnassignStudentFromCourseUseCase implements Usecase<bool, UnassignStudentFromCourseParams> {
  final StudentCourseRepository repo;
  UnassignStudentFromCourseUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(UnassignStudentFromCourseParams params) {
    return repo.unassignStudentFromCourse(
      studentId: params.studentId,
      courseId: params.courseId,
    );
  }
}

