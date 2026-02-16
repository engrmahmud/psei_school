import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/student_course_repository.dart';

class AssignStudentToCourseParams {
  final int studentId;
  final int courseId;
  AssignStudentToCourseParams({required this.studentId, required this.courseId});
}

class AssignStudentToCourseUseCase implements Usecase<StudentCourse, AssignStudentToCourseParams> {
  final StudentCourseRepository repo;
  AssignStudentToCourseUseCase(this.repo);

  @override
  Future<Either<Failure, StudentCourse>> call(AssignStudentToCourseParams params) {
    return repo.assignStudentToCourse(
      studentId: params.studentId,
      courseId: params.courseId,
    );
  }
}

