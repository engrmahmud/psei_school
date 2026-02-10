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

abstract class StudentCourse implements _i1.SerializableModel {
  StudentCourse._({
    this.id,
    required this.studentId,
    required this.courseId,
    this.marks,
    required this.enrollmentDate,
  });

  factory StudentCourse({
    int? id,
    required int studentId,
    required int courseId,
    double? marks,
    required DateTime enrollmentDate,
  }) = _StudentCourseImpl;

  factory StudentCourse.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudentCourse(
      id: jsonSerialization['id'] as int?,
      studentId: jsonSerialization['studentId'] as int,
      courseId: jsonSerialization['courseId'] as int,
      marks: (jsonSerialization['marks'] as num?)?.toDouble(),
      enrollmentDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['enrollmentDate'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int studentId;

  int courseId;

  double? marks;

  DateTime enrollmentDate;

  /// Returns a shallow copy of this [StudentCourse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StudentCourse copyWith({
    int? id,
    int? studentId,
    int? courseId,
    double? marks,
    DateTime? enrollmentDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudentCourse',
      if (id != null) 'id': id,
      'studentId': studentId,
      'courseId': courseId,
      if (marks != null) 'marks': marks,
      'enrollmentDate': enrollmentDate.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentCourseImpl extends StudentCourse {
  _StudentCourseImpl({
    int? id,
    required int studentId,
    required int courseId,
    double? marks,
    required DateTime enrollmentDate,
  }) : super._(
         id: id,
         studentId: studentId,
         courseId: courseId,
         marks: marks,
         enrollmentDate: enrollmentDate,
       );

  /// Returns a shallow copy of this [StudentCourse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StudentCourse copyWith({
    Object? id = _Undefined,
    int? studentId,
    int? courseId,
    Object? marks = _Undefined,
    DateTime? enrollmentDate,
  }) {
    return StudentCourse(
      id: id is int? ? id : this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
      marks: marks is double? ? marks : this.marks,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
    );
  }
}
