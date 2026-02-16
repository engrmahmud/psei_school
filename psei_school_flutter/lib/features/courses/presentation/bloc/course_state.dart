import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class CourseState extends Equatable {
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;
  CourseLoaded(this.courses);
}

class CourseSuccess extends CourseState {
  final String message;
  CourseSuccess(this.message);
}

class CourseError extends CourseState {
  final String error;
  CourseError(this.error);
}

