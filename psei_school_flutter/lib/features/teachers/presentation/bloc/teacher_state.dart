import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class TeacherState extends Equatable {
  List<Object?> get props => [];
}

class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class TeacherLoaded extends TeacherState {
  final List<Teacher> teachers;
  TeacherLoaded(this.teachers);
}

class TeacherSuccess extends TeacherState {
  final String message;
  TeacherSuccess(this.message);
}

class TeacherError extends TeacherState {
  final String error;
  TeacherError(this.error);
}

