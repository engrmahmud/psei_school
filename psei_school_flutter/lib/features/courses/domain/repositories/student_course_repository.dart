import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';

abstract class StudentCourseRepository {
  Future<Either<Failure, StudentCourse>> assignStudentToCourse({
    required int studentId,
    required int courseId,
  });

  Future<Either<Failure, List<StudentCourse>>> getStudentCoursesByCourse(int courseId);

  Future<Either<Failure, List<StudentCourse>>> getStudentCoursesByStudent(int studentId);

  Future<Either<Failure, StudentCourse>> updateStudentCourseMarks({
    required int studentCourseId,
    double? marks,
  });

  Future<Either<Failure, bool>> unassignStudentFromCourse({
    required int studentId,
    required int courseId,
  });

  Future<Either<Failure, bool>> deleteStudentCourse(int id);

  Future<Either<Failure, List<Student>>> getStudentsByCourse(int courseId);

  Future<Either<Failure, List<Course>>> getCoursesByStudent(int studentId);

  Future<Either<Failure, bool>> isStudentEnrolled({
    required int studentId,
    required int courseId,
  });

  Future<Either<Failure, List<StudentCourse>>> bulkAssignStudentsToCourse({
    required List<int> studentIds,
    required int courseId,
  });
}

