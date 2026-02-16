import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';
import '../../../../core/error/failures.dart';

class StudentRepositoryImpl implements StudentRepository {
  final Client client;
  StudentRepositoryImpl(this.client);

  @override
  Future<Either<Failure, List<Student>>> getAllStudents() async {
    try {
      debugPrint('StudentRepositoryImpl: Calling getStudents from client...');
      final result = await client.studentEndpoints.getStudents();
      debugPrint('StudentRepositoryImpl: Received ${result.length} students');
      return Right(result);
    } catch (e) {
      debugPrint('StudentRepositoryImpl Error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Student>> getStudentById(int id) async {
    try {
      final result = await client.studentEndpoints.getStudentById(id);
      return result != null ? Right(result) : Left(ServerFailure('Not found'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Student>> createStudent(Student student) async {
    try {
      final result = await client.studentEndpoints.createStudent(student);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Student>> updateStudent(int id, Student student) async {
    try {
      final result = await client.studentEndpoints.updateStudentById(id, student);
      return result != null ? Right(result) : Left(ServerFailure('Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteStudent(int id) async {
    try {
      final result = await client.studentEndpoints.deleteStudentById(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Student>>> searchStudents({
    String? name,
    int? id,
    String? roll,
    String? registration,
    String? studentClass,
  }) async {
    try {
      final result = await client.studentEndpoints.searchStudents(
        name: name,
        id: id,
        roll: roll,
        registration: registration,
        studentClass: studentClass,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
