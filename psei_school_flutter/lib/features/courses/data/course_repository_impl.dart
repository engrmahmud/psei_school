import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';
import '../../../../core/error/failures.dart';

class CourseRepositoryImpl implements CourseRepository {
  final Client client;
  CourseRepositoryImpl(this.client);

  @override
  Future<Either<Failure, List<Course>>> getAllCourses() async {
    try {
      debugPrint('CourseRepositoryImpl: Calling getCourses from client...');
      final result = await client.courseEndpoints.getCourses();
      debugPrint('CourseRepositoryImpl: Received ${result.length} courses');
      return Right(result);
    } catch (e) {
      debugPrint('CourseRepositoryImpl Error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Course>> getCourseById(int id) async {
    try {
      final result = await client.courseEndpoints.getCourseById(id);
      return result != null ? Right(result) : Left(ServerFailure('Not found'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Course>> createCourse(Course course) async {
    try {
      final result = await client.courseEndpoints.createCourse(course);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Course>> updateCourse(int id, Course course) async {
    try {
      final result = await client.courseEndpoints.updateCourseById(id, course);
      return result != null ? Right(result) : Left(ServerFailure('Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(int id) async {
    try {
      final result = await client.courseEndpoints.deleteCourseById(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> searchCourses({
    String? courseName,
    String? subjectCode,
    int? classLevel,
    int? teacherId,
  }) async {
    try {
      final result = await client.courseEndpoints.searchCourses(
        courseName: courseName,
        subjectCode: subjectCode,
        classLevel: classLevel,
        teacherId: teacherId,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

