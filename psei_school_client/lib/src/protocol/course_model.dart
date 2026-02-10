/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Course implements _i1.SerializableModel {
  Course._({
    this.id,
    required this.courseName,
    required this.subjectCode,
    this.description,
    required this.classLevel,
    required this.teacherId,
  });

  factory Course({
    int? id,
    required String courseName,
    required String subjectCode,
    String? description,
    required int classLevel,
    required int teacherId,
  }) = _CourseImpl;

  factory Course.fromJson(Map<String, dynamic> jsonSerialization) {
    return Course(
      id: jsonSerialization['id'] as int?,
      courseName: jsonSerialization['courseName'] as String,
      subjectCode: jsonSerialization['subjectCode'] as String,
      description: jsonSerialization['description'] as String?,
      classLevel: jsonSerialization['classLevel'] as int,
      teacherId: jsonSerialization['teacherId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String courseName;

  String subjectCode;

  String? description;

  int classLevel;

  int teacherId;

  /// Returns a shallow copy of this [Course]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Course copyWith({
    int? id,
    String? courseName,
    String? subjectCode,
    String? description,
    int? classLevel,
    int? teacherId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Course',
      if (id != null) 'id': id,
      'courseName': courseName,
      'subjectCode': subjectCode,
      if (description != null) 'description': description,
      'classLevel': classLevel,
      'teacherId': teacherId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseImpl extends Course {
  _CourseImpl({
    int? id,
    required String courseName,
    required String subjectCode,
    String? description,
    required int classLevel,
    required int teacherId,
  }) : super._(
         id: id,
         courseName: courseName,
         subjectCode: subjectCode,
         description: description,
         classLevel: classLevel,
         teacherId: teacherId,
       );

  /// Returns a shallow copy of this [Course]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Course copyWith({
    Object? id = _Undefined,
    String? courseName,
    String? subjectCode,
    Object? description = _Undefined,
    int? classLevel,
    int? teacherId,
  }) {
    return Course(
      id: id is int? ? id : this.id,
      courseName: courseName ?? this.courseName,
      subjectCode: subjectCode ?? this.subjectCode,
      description: description is String? ? description : this.description,
      classLevel: classLevel ?? this.classLevel,
      teacherId: teacherId ?? this.teacherId,
    );
  }
}
