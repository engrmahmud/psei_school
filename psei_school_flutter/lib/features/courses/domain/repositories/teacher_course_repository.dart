import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';

abstract class TeacherCourseRepository {
  Future<Either<Failure, TeacherCourse>> assignTeacherToCourse({
    required int teacherId,
    required int courseId,
    String? role,
  });

  Future<Either<Failure, List<TeacherCourse>>> getTeacherCoursesByCourse(int courseId);

  Future<Either<Failure, List<TeacherCourse>>> getTeacherCoursesByTeacher(int teacherId);

  Future<Either<Failure, TeacherCourse>> updateTeacherCourseRole({
    required int teacherCourseId,
    String? role,
  });

  Future<Either<Failure, bool>> unassignTeacherFromCourse({
    required int teacherId,
    required int courseId,
  });

  Future<Either<Failure, bool>> deleteTeacherCourse(int id);

  Future<Either<Failure, List<Teacher>>> getTeachersByCourse(int courseId);

  Future<Either<Failure, List<Course>>> getCoursesByTeacher(int teacherId);

  Future<Either<Failure, bool>> isTeacherAssigned({
    required int teacherId,
    required int courseId,
  });

  Future<Either<Failure, TeacherCourse?>> getTeacherCourseByTeacherAndCourse({
    required int teacherId,
    required int courseId,
  });
}

