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
import 'admin_model.dart' as _i2;
import 'course_model.dart' as _i3;
import 'student_course_model.dart' as _i4;
import 'student_model.dart' as _i5;
import 'teacher_course_model.dart' as _i6;
import 'teacher_model.dart' as _i7;
import 'package:psei_school_client/src/protocol/course_model.dart' as _i8;
import 'package:psei_school_client/src/protocol/student_model.dart' as _i9;
import 'package:psei_school_client/src/protocol/teacher_model.dart' as _i10;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i11;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i12;
export 'admin_model.dart';
export 'course_model.dart';
export 'student_course_model.dart';
export 'student_model.dart';
export 'teacher_course_model.dart';
export 'teacher_model.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Admin) {
      return _i2.Admin.fromJson(data) as T;
    }
    if (t == _i3.Course) {
      return _i3.Course.fromJson(data) as T;
    }
    if (t == _i4.StudentCourse) {
      return _i4.StudentCourse.fromJson(data) as T;
    }
    if (t == _i5.Student) {
      return _i5.Student.fromJson(data) as T;
    }
    if (t == _i6.TeacherCourse) {
      return _i6.TeacherCourse.fromJson(data) as T;
    }
    if (t == _i7.Teacher) {
      return _i7.Teacher.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Admin?>()) {
      return (data != null ? _i2.Admin.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Course?>()) {
      return (data != null ? _i3.Course.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.StudentCourse?>()) {
      return (data != null ? _i4.StudentCourse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Student?>()) {
      return (data != null ? _i5.Student.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.TeacherCourse?>()) {
      return (data != null ? _i6.TeacherCourse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Teacher?>()) {
      return (data != null ? _i7.Teacher.fromJson(data) : null) as T;
    }
    if (t == List<_i8.Course>) {
      return (data as List).map((e) => deserialize<_i8.Course>(e)).toList()
          as T;
    }
    if (t == List<_i9.Student>) {
      return (data as List).map((e) => deserialize<_i9.Student>(e)).toList()
          as T;
    }
    if (t == List<_i10.Teacher>) {
      return (data as List).map((e) => deserialize<_i10.Teacher>(e)).toList()
          as T;
    }
    if (t == List<_i4.StudentCourse>) {
      return (data as List).map((e) => deserialize<_i4.StudentCourse>(e)).toList()
          as T;
    }
    if (t == List<_i6.TeacherCourse>) {
      return (data as List).map((e) => deserialize<_i6.TeacherCourse>(e)).toList()
          as T;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Admin => 'Admin',
      _i3.Course => 'Course',
      _i4.StudentCourse => 'StudentCourse',
      _i5.Student => 'Student',
      _i6.TeacherCourse => 'TeacherCourse',
      _i7.Teacher => 'Teacher',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('psei_school.', '');
    }

    switch (data) {
      case _i2.Admin():
        return 'Admin';
      case _i3.Course():
        return 'Course';
      case _i4.StudentCourse():
        return 'StudentCourse';
      case _i5.Student():
        return 'Student';
      case _i6.TeacherCourse():
        return 'TeacherCourse';
      case _i7.Teacher():
        return 'Teacher';
    }
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Admin') {
      return deserialize<_i2.Admin>(data['data']);
    }
    if (dataClassName == 'Course') {
      return deserialize<_i3.Course>(data['data']);
    }
    if (dataClassName == 'StudentCourse') {
      return deserialize<_i4.StudentCourse>(data['data']);
    }
    if (dataClassName == 'Student') {
      return deserialize<_i5.Student>(data['data']);
    }
    if (dataClassName == 'TeacherCourse') {
      return deserialize<_i6.TeacherCourse>(data['data']);
    }
    if (dataClassName == 'Teacher') {
      return deserialize<_i7.Teacher>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i11.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i12.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i11.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i12.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
