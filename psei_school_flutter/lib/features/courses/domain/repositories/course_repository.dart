import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<Course>>> getAllCourses();
  Future<Either<Failure, Course>> getCourseById(int id);
  Future<Either<Failure, Course>> createCourse(Course course);
  Future<Either<Failure, Course>> updateCourse(int id, Course course);
  Future<Either<Failure, bool>> deleteCourse(int id);
  Future<Either<Failure, List<Course>>> searchCourses({
    String? courseName,
    String? subjectCode,
    int? classLevel,
    int? teacherId,
  });
}

