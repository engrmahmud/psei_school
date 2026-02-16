import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<Student>>> getAllStudents();
  Future<Either<Failure, Student>> getStudentById(int id);
  Future<Either<Failure, Student>> createStudent(Student student);
  Future<Either<Failure, Student>> updateStudent(int id, Student student);
  Future<Either<Failure, void>> deleteStudent(int id);
  Future<Either<Failure, List<Student>>> searchStudents({
    String? name,
    int? id,
    String? roll,
    String? registration,
    String? studentClass,
  });
}
