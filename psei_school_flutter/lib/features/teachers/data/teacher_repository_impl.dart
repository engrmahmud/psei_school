import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';
import '../../../../core/error/failures.dart';

class TeacherRepositoryImpl implements TeacherRepository {
  final Client client;
  TeacherRepositoryImpl(this.client);

  @override
  Future<Either<Failure, List<Teacher>>> getAllTeachers() async {
    try {
      debugPrint('TeacherRepositoryImpl: Calling getTeachers from client...');
      final result = await client.teacherEndpoints.getTeachers();
      debugPrint('TeacherRepositoryImpl: Received ${result.length} teachers');
      return Right(result);
    } catch (e) {
      debugPrint('TeacherRepositoryImpl Error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Teacher>> getTeacherById(int id) async {
    try {
      final result = await client.teacherEndpoints.getTeacherById(id);
      return result != null ? Right(result) : Left(ServerFailure('Not found'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Teacher>> createTeacher(Teacher teacher) async {
    try {
      final result = await client.teacherEndpoints.createTeacher(teacher);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Teacher>> updateTeacher(int id, Teacher teacher) async {
    try {
      final result = await client.teacherEndpoints.updateTeacherById(id, teacher);
      return result != null ? Right(result) : Left(ServerFailure('Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTeacher(int id) async {
    try {
      final result = await client.teacherEndpoints.deleteTeacherById(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Teacher>>> searchTeachers({
    String? name,
    int? id,
    String? department,
    String? designation,
  }) async {
    try {
      final result = await client.teacherEndpoints.searchTeachers(
        name: name,
        id: id,
        department: department,
        designation: designation,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

