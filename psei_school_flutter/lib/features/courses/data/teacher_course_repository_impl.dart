import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/teacher_course_repository.dart';

class TeacherCourseRepositoryImpl implements TeacherCourseRepository {
  final Client client;
  TeacherCourseRepositoryImpl(this.client);

  @override
  Future<Either<Failure, TeacherCourse>> assignTeacherToCourse({
    required int teacherId,
    required int courseId,
    String? role,
  }) async {
    try {
      final result = await client.teacherCourseEndpoints.assignTeacherToCourse(
        teacherId: teacherId,
        courseId: courseId,
        role: role,
      );
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: assignTeacherToCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TeacherCourse>>> getTeacherCoursesByCourse(int courseId) async {
    try {
      final result = await client.teacherCourseEndpoints.getTeacherCoursesByCourse(courseId);
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: getTeacherCoursesByCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TeacherCourse>>> getTeacherCoursesByTeacher(int teacherId) async {
    try {
      final result = await client.teacherCourseEndpoints.getTeacherCoursesByTeacher(teacherId);
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: getTeacherCoursesByTeacher error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TeacherCourse>> updateTeacherCourseRole({
    required int teacherCourseId,
    String? role,
  }) async {
    try {
      final result = await client.teacherCourseEndpoints.updateTeacherCourseRole(
        teacherCourseId: teacherCourseId,
        role: role,
      );
      return result != null 
        ? Right(result) 
        : Left(ServerFailure('Failed to update role'));
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: updateTeacherCourseRole error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unassignTeacherFromCourse({
    required int teacherId,
    required int courseId,
  }) async {
    try {
      final result = await client.teacherCourseEndpoints.unassignTeacherFromCourse(
        teacherId: teacherId,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: unassignTeacherFromCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTeacherCourse(int id) async {
    try {
      final result = await client.teacherCourseEndpoints.deleteTeacherCourseById(id);
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: deleteTeacherCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Teacher>>> getTeachersByCourse(int courseId) async {
    try {
      final result = await client.teacherCourseEndpoints.getTeachersByCourse(courseId);
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: getTeachersByCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCoursesByTeacher(int teacherId) async {
    try {
      final result = await client.teacherCourseEndpoints.getCoursesByTeacher(teacherId);
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: getCoursesByTeacher error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isTeacherAssigned({
    required int teacherId,
    required int courseId,
  }) async {
    try {
      final result = await client.teacherCourseEndpoints.isTeacherAssigned(
        teacherId: teacherId,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: isTeacherAssigned error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TeacherCourse?>> getTeacherCourseByTeacherAndCourse({
    required int teacherId,
    required int courseId,
  }) async {
    try {
      final result = await client.teacherCourseEndpoints.getTeacherCourseByTeacherAndCourse(
        teacherId: teacherId,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('TeacherCourseRepositoryImpl: getTeacherCourseByTeacherAndCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}

