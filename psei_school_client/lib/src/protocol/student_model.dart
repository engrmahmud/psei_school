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

abstract class Student implements _i1.SerializableModel {
  Student._({
    this.id,
    required this.academicYear,
    required this.admissionDate,
    required this.studentName,
    required this.dateOfBirth,
    required this.gender,
    required this.religion,
    required this.bloodGroup,
    required this.nationality,
    required this.fatherName,
    required this.motherName,
    required this.email,
    required this.phone,
    required this.address,
    required this.studentClass,
    required this.section,
    required this.roll,
    required this.registration,
    required this.password,
  });

  factory Student({
    int? id,
    required String academicYear,
    required DateTime admissionDate,
    required String studentName,
    required DateTime dateOfBirth,
    required String gender,
    required String religion,
    required String bloodGroup,
    required String nationality,
    required String fatherName,
    required String motherName,
    required String email,
    required String phone,
    required String address,
    required String studentClass,
    required String section,
    required String roll,
    required String registration,
    required String password,
  }) = _StudentImpl;

  factory Student.fromJson(Map<String, dynamic> jsonSerialization) {
    return Student(
      id: jsonSerialization['id'] as int?,
      academicYear: jsonSerialization['academicYear'] as String,
      admissionDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['admissionDate'],
      ),
      studentName: jsonSerialization['studentName'] as String,
      dateOfBirth: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['dateOfBirth'],
      ),
      gender: jsonSerialization['gender'] as String,
      religion: jsonSerialization['religion'] as String,
      bloodGroup: jsonSerialization['bloodGroup'] as String,
      nationality: jsonSerialization['nationality'] as String,
      fatherName: jsonSerialization['fatherName'] as String,
      motherName: jsonSerialization['motherName'] as String,
      email: jsonSerialization['email'] as String,
      phone: jsonSerialization['phone'] as String,
      address: jsonSerialization['address'] as String,
      studentClass: jsonSerialization['studentClass'] as String,
      section: jsonSerialization['section'] as String,
      roll: jsonSerialization['roll'] as String,
      registration: jsonSerialization['registration'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String academicYear;

  DateTime admissionDate;

  String studentName;

  DateTime dateOfBirth;

  String gender;

  String religion;

  String bloodGroup;

  String nationality;

  String fatherName;

  String motherName;

  String email;

  String phone;

  String address;

  String studentClass;

  String section;

  String roll;

  String registration;

  String password;

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Student copyWith({
    int? id,
    String? academicYear,
    DateTime? admissionDate,
    String? studentName,
    DateTime? dateOfBirth,
    String? gender,
    String? religion,
    String? bloodGroup,
    String? nationality,
    String? fatherName,
    String? motherName,
    String? email,
    String? phone,
    String? address,
    String? studentClass,
    String? section,
    String? roll,
    String? registration,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Student',
      if (id != null) 'id': id,
      'academicYear': academicYear,
      'admissionDate': admissionDate.toJson(),
      'studentName': studentName,
      'dateOfBirth': dateOfBirth.toJson(),
      'gender': gender,
      'religion': religion,
      'bloodGroup': bloodGroup,
      'nationality': nationality,
      'fatherName': fatherName,
      'motherName': motherName,
      'email': email,
      'phone': phone,
      'address': address,
      'studentClass': studentClass,
      'section': section,
      'roll': roll,
      'registration': registration,
      'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentImpl extends Student {
  _StudentImpl({
    int? id,
    required String academicYear,
    required DateTime admissionDate,
    required String studentName,
    required DateTime dateOfBirth,
    required String gender,
    required String religion,
    required String bloodGroup,
    required String nationality,
    required String fatherName,
    required String motherName,
    required String email,
    required String phone,
    required String address,
    required String studentClass,
    required String section,
    required String roll,
    required String registration,
    required String password,
  }) : super._(
         id: id,
         academicYear: academicYear,
         admissionDate: admissionDate,
         studentName: studentName,
         dateOfBirth: dateOfBirth,
         gender: gender,
         religion: religion,
         bloodGroup: bloodGroup,
         nationality: nationality,
         fatherName: fatherName,
         motherName: motherName,
         email: email,
         phone: phone,
         address: address,
         studentClass: studentClass,
         section: section,
         roll: roll,
         registration: registration,
         password: password,
       );

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Student copyWith({
    Object? id = _Undefined,
    String? academicYear,
    DateTime? admissionDate,
    String? studentName,
    DateTime? dateOfBirth,
    String? gender,
    String? religion,
    String? bloodGroup,
    String? nationality,
    String? fatherName,
    String? motherName,
    String? email,
    String? phone,
    String? address,
    String? studentClass,
    String? section,
    String? roll,
    String? registration,
    String? password,
  }) {
    return Student(
      id: id is int? ? id : this.id,
      academicYear: academicYear ?? this.academicYear,
      admissionDate: admissionDate ?? this.admissionDate,
      studentName: studentName ?? this.studentName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      religion: religion ?? this.religion,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      nationality: nationality ?? this.nationality,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      studentClass: studentClass ?? this.studentClass,
      section: section ?? this.section,
      roll: roll ?? this.roll,
      registration: registration ?? this.registration,
      password: password ?? this.password,
    );
  }
}
