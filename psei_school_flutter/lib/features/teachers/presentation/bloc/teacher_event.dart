import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class TeacherEvent extends Equatable {
  List<Object?> get props => [];
}

class LoadTeachers extends TeacherEvent {}

class GetTeacherById extends TeacherEvent {
  final int id;
  GetTeacherById(this.id);
}

class CreateTeacher extends TeacherEvent {
  final Teacher teacher;
  CreateTeacher(this.teacher);
}

class UpdateTeacher extends TeacherEvent {
  final Teacher teacher;
  final int id;
  UpdateTeacher(this.id, this.teacher);
}

class DeleteTeacher extends TeacherEvent {
  final int id;
  DeleteTeacher(this.id);
}

class SearchTeachers extends TeacherEvent {
  final String? name;
  final int? id;
  final String? department;
  final String? designation;

  SearchTeachers({
    this.name,
    this.id,
    this.department,
    this.designation,
  });
}

