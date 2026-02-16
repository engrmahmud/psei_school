import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/error/failures.dart';

abstract class TeacherRepository {
  Future<Either<Failure, List<Teacher>>> getAllTeachers();
  Future<Either<Failure, Teacher>> getTeacherById(int id);
  Future<Either<Failure, Teacher>> createTeacher(Teacher teacher);
  Future<Either<Failure, Teacher>> updateTeacher(int id, Teacher teacher);
  Future<Either<Failure, bool>> deleteTeacher(int id);
  Future<Either<Failure, List<Teacher>>> searchTeachers({
    String? name,
    int? id,
    String? department,
    String? designation,
  });
}

