import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';

class SearchCoursesUseCase implements Usecase<List<Course>, SearchCourseParams> {
  final CourseRepository repo;
  SearchCoursesUseCase(this.repo);

  @override
  Future<Either<Failure, List<Course>>> call(SearchCourseParams params) {
    return repo.searchCourses(
      courseName: params.courseName,
      subjectCode: params.subjectCode,
      classLevel: params.classLevel,
      teacherId: params.teacherId,
    );
  }
}

class SearchCourseParams {
  final String? courseName;
  final String? subjectCode;
  final int? classLevel;
  final int? teacherId;

  SearchCourseParams({
    this.courseName,
    this.subjectCode,
    this.classLevel,
    this.teacherId,
  });
}

