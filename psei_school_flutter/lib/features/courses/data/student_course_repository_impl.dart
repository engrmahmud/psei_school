import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/student_course_repository.dart';

class StudentCourseRepositoryImpl implements StudentCourseRepository {
  final Client client;
  StudentCourseRepositoryImpl(this.client);

  @override
  Future<Either<Failure, StudentCourse>> assignStudentToCourse({
    required int studentId,
    required int courseId,
  }) async {
    try {
      final result = await client.studentCourseEndpoints.assignStudentToCourse(
        studentId: studentId,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: assignStudentToCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StudentCourse>>> getStudentCoursesByCourse(int courseId) async {
    try {
      final result = await client.studentCourseEndpoints.getStudentCoursesByCourse(courseId);
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: getStudentCoursesByCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StudentCourse>>> getStudentCoursesByStudent(int studentId) async {
    try {
      final result = await client.studentCourseEndpoints.getStudentCoursesByStudent(studentId);
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: getStudentCoursesByStudent error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentCourse>> updateStudentCourseMarks({
    required int studentCourseId,
    double? marks,
  }) async {
    try {
      final result = await client.studentCourseEndpoints.updateStudentCourseMarks(
        studentCourseId: studentCourseId,
        marks: marks,
      );
      return result != null 
        ? Right(result) 
        : Left(ServerFailure('Failed to update marks'));
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: updateStudentCourseMarks error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unassignStudentFromCourse({
    required int studentId,
    required int courseId,
  }) async {
    try {
      final result = await client.studentCourseEndpoints.unassignStudentFromCourse(
        studentId: studentId,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: unassignStudentFromCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteStudentCourse(int id) async {
    try {
      final result = await client.studentCourseEndpoints.deleteStudentCourseById(id);
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: deleteStudentCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Student>>> getStudentsByCourse(int courseId) async {
    try {
      final result = await client.studentCourseEndpoints.getStudentsByCourse(courseId);
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: getStudentsByCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCoursesByStudent(int studentId) async {
    try {
      final result = await client.studentCourseEndpoints.getCoursesByStudent(studentId);
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: getCoursesByStudent error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isStudentEnrolled({
    required int studentId,
    required int courseId,
  }) async {
    try {
      final result = await client.studentCourseEndpoints.isStudentEnrolled(
        studentId: studentId,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: isStudentEnrolled error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StudentCourse>>> bulkAssignStudentsToCourse({
    required List<int> studentIds,
    required int courseId,
  }) async {
    try {
      final result = await client.studentCourseEndpoints.bulkAssignStudentsToCourse(
        studentIds: studentIds,
        courseId: courseId,
      );
      return Right(result);
    } catch (e) {
      debugPrint('StudentCourseRepositoryImpl: bulkAssignStudentsToCourse error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}

