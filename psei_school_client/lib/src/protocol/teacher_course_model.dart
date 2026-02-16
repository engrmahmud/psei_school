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

abstract class TeacherCourse implements _i1.SerializableModel {
  TeacherCourse._({
    this.id,
    required this.teacherId,
    required this.courseId,
    required this.assignedDate,
    this.role,
  });

  factory TeacherCourse({
    int? id,
    required int teacherId,
    required int courseId,
    required DateTime assignedDate,
    String? role,
  }) = _TeacherCourseImpl;

  factory TeacherCourse.fromJson(Map<String, dynamic> jsonSerialization) {
    return TeacherCourse(
      id: jsonSerialization['id'] as int?,
      teacherId: jsonSerialization['teacherId'] as int,
      courseId: jsonSerialization['courseId'] as int,
      assignedDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['assignedDate'],
      ),
      role: jsonSerialization['role'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int teacherId;

  int courseId;

  DateTime assignedDate;

  String? role;

  /// Returns a shallow copy of this [TeacherCourse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TeacherCourse copyWith({
    int? id,
    int? teacherId,
    int? courseId,
    DateTime? assignedDate,
    String? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TeacherCourse',
      if (id != null) 'id': id,
      'teacherId': teacherId,
      'courseId': courseId,
      'assignedDate': assignedDate.toJson(),
      if (role != null) 'role': role,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeacherCourseImpl extends TeacherCourse {
  _TeacherCourseImpl({
    int? id,
    required int teacherId,
    required int courseId,
    required DateTime assignedDate,
    String? role,
  }) : super._(
         id: id,
         teacherId: teacherId,
         courseId: courseId,
         assignedDate: assignedDate,
         role: role,
       );

  /// Returns a shallow copy of this [TeacherCourse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TeacherCourse copyWith({
    Object? id = _Undefined,
    int? teacherId,
    int? courseId,
    DateTime? assignedDate,
    Object? role = _Undefined,
  }) {
    return TeacherCourse(
      id: id is int? ? id : this.id,
      teacherId: teacherId ?? this.teacherId,
      courseId: courseId ?? this.courseId,
      assignedDate: assignedDate ?? this.assignedDate,
      role: role is String? ? role : this.role,
    );
  }
}
