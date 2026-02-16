import 'package:equatable/equatable.dart';
import 'package:psei_school_client/psei_school_client.dart';

abstract class StudentEvent extends Equatable{
  List<Object?> get props => [];

}

class LoadStudents extends StudentEvent{}



class GetStudentById extends StudentEvent{
  final int id;

  GetStudentById(this.id);

}

class CreateStudent extends StudentEvent {
  final Student student;

  CreateStudent(this.student);
}


class UpdateStudent extends StudentEvent {
  final Student student;
  final int id;

  UpdateStudent(this.id, this.student);
}


class DeleteStudent extends StudentEvent {
  final int id;

  DeleteStudent(this.id);
}

class SearchStudents extends StudentEvent {
  final String? name;
  final int? id;
  final String? roll;
  final String? registration;
  final String? studentClass;

  SearchStudents({
    this.name,
    this.id,
    this.roll,
    this.registration,
    this.studentClass,
  });
}
