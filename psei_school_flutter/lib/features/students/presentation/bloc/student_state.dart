import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class StudentState extends Equatable{
  List<Object?> get props => [];

}

class StudentInitial extends StudentState{}

class StudentLoading extends StudentState{}

class StudentLoaded extends StudentState{
  final List<Student> students;

  StudentLoaded(this.students);
}

class StudentSuccess extends StudentState{
  final String message;

  StudentSuccess(this.message);

}

class StudentError extends StudentState{
  final String error;

  StudentError(this.error);
}