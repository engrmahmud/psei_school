import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class StudentCourseState extends Equatable {
  const StudentCourseState();
  @override
  List<Object?> get props => [];
}

class StudentCourseInitial extends StudentCourseState {}

class StudentCourseLoading extends StudentCourseState {}

class StudentCourseLoaded extends StudentCourseState {
  final List<Student> students;
  final int courseId;
  const StudentCourseLoaded({required this.students, required this.courseId});
  @override
  List<Object?> get props => [students, courseId];
}

class StudentCourseAssigned extends StudentCourseState {
  final StudentCourse studentCourse;
  const StudentCourseAssigned(this.studentCourse);
  @override
  List<Object?> get props => [studentCourse];
}

class StudentCourseUnassigned extends StudentCourseState {
  final String message;
  const StudentCourseUnassigned(this.message);
  @override
  List<Object?> get props => [message];
}

class StudentCourseBulkAssigned extends StudentCourseState {
  final List<StudentCourse> studentCourses;
  const StudentCourseBulkAssigned(this.studentCourses);
  @override
  List<Object?> get props => [studentCourses];
}

class StudentCourseMarksUpdated extends StudentCourseState {
  final StudentCourse studentCourse;
  const StudentCourseMarksUpdated(this.studentCourse);
  @override
  List<Object?> get props => [studentCourse];
}

class StudentCourseError extends StudentCourseState {
  final String error;
  const StudentCourseError(this.error);
  @override
  List<Object?> get props => [error];
}

