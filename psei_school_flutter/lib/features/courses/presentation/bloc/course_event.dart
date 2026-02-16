import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class CourseEvent extends Equatable {
  List<Object?> get props => [];
}

class LoadCourses extends CourseEvent {}

class GetCourseById extends CourseEvent {
  final int id;
  GetCourseById(this.id);
}

class CreateCourse extends CourseEvent {
  final Course course;
  CreateCourse(this.course);
}

class UpdateCourse extends CourseEvent {
  final Course course;
  final int id;
  UpdateCourse(this.id, this.course);
}

class DeleteCourse extends CourseEvent {
  final int id;
  DeleteCourse(this.id);
}

class SearchCourses extends CourseEvent {
  final String? courseName;
  final String? subjectCode;
  final int? classLevel;
  final int? teacherId;

  SearchCourses({
    this.courseName,
    this.subjectCode,
    this.classLevel,
    this.teacherId,
  });
}

