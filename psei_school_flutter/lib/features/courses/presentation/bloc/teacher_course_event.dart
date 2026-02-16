import 'package:equatable/equatable.dart';

abstract class TeacherCourseEvent extends Equatable {
  const TeacherCourseEvent();
  @override
  List<Object?> get props => [];
}

class LoadTeachersByCourse extends TeacherCourseEvent {
  final int courseId;
  const LoadTeachersByCourse(this.courseId);
  @override
  List<Object?> get props => [courseId];
}

class AssignTeacherToCourse extends TeacherCourseEvent {
  final int teacherId;
  final int courseId;
  final String? role;
  const AssignTeacherToCourse({
    required this.teacherId,
    required this.courseId,
    this.role,
  });
  @override
  List<Object?> get props => [teacherId, courseId, role];
}

class UnassignTeacherFromCourse extends TeacherCourseEvent {
  final int teacherId;
  final int courseId;
  const UnassignTeacherFromCourse({required this.teacherId, required this.courseId});
  @override
  List<Object?> get props => [teacherId, courseId];
}

class UpdateTeacherRole extends TeacherCourseEvent {
  final int teacherCourseId;
  final String? role;
  const UpdateTeacherRole({required this.teacherCourseId, this.role});
  @override
  List<Object?> get props => [teacherCourseId, role];
}

