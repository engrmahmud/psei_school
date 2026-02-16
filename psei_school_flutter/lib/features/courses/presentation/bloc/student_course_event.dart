import 'package:equatable/equatable.dart';

abstract class StudentCourseEvent extends Equatable {
  const StudentCourseEvent();
  @override
  List<Object?> get props => [];
}

class LoadStudentsByCourse extends StudentCourseEvent {
  final int courseId;
  const LoadStudentsByCourse(this.courseId);
  @override
  List<Object?> get props => [courseId];
}

class AssignStudentToCourse extends StudentCourseEvent {
  final int studentId;
  final int courseId;
  const AssignStudentToCourse({required this.studentId, required this.courseId});
  @override
  List<Object?> get props => [studentId, courseId];
}

class UnassignStudentFromCourse extends StudentCourseEvent {
  final int studentId;
  final int courseId;
  const UnassignStudentFromCourse({required this.studentId, required this.courseId});
  @override
  List<Object?> get props => [studentId, courseId];
}

class BulkAssignStudentsToCourse extends StudentCourseEvent {
  final List<int> studentIds;
  final int courseId;
  const BulkAssignStudentsToCourse({required this.studentIds, required this.courseId});
  @override
  List<Object?> get props => [studentIds, courseId];
}

class UpdateStudentMarks extends StudentCourseEvent {
  final int studentCourseId;
  final double? marks;
  const UpdateStudentMarks({required this.studentCourseId, this.marks});
  @override
  List<Object?> get props => [studentCourseId, marks];
}

