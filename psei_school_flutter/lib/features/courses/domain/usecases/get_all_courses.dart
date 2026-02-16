import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';

class GetAllCoursesUseCase implements Usecase<List<Course>, NoParams> {
  final CourseRepository repo;
  GetAllCoursesUseCase(this.repo);

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) {
    return repo.getAllCourses();
  }
}

