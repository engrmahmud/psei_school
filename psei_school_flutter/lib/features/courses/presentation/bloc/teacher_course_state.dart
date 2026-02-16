import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class TeacherCourseState extends Equatable {
  const TeacherCourseState();
  @override
  List<Object?> get props => [];
}

class TeacherCourseInitial extends TeacherCourseState {}

class TeacherCourseLoading extends TeacherCourseState {}

class TeacherCourseLoaded extends TeacherCourseState {
  final List<Teacher> teachers;
  final int courseId;
  const TeacherCourseLoaded({required this.teachers, required this.courseId});
  @override
  List<Object?> get props => [teachers, courseId];
}

class TeacherCourseAssigned extends TeacherCourseState {
  final TeacherCourse teacherCourse;
  const TeacherCourseAssigned(this.teacherCourse);
  @override
  List<Object?> get props => [teacherCourse];
}

class TeacherCourseUnassigned extends TeacherCourseState {
  final String message;
  const TeacherCourseUnassigned(this.message);
  @override
  List<Object?> get props => [message];
}

class TeacherCourseRoleUpdated extends TeacherCourseState {
  final TeacherCourse teacherCourse;
  const TeacherCourseRoleUpdated(this.teacherCourse);
  @override
  List<Object?> get props => [teacherCourse];
}

class TeacherCourseError extends TeacherCourseState {
  final String error;
  const TeacherCourseError(this.error);
  @override
  List<Object?> get props => [error];
}

