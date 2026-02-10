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

abstract class Teacher implements _i1.SerializableModel {
  Teacher._({
    this.id,
    required this.teacherName,
    required this.department,
    required this.designation,
    required this.qualification,
    required this.joiningDate,
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
    required this.permanentAddress,
    required this.registration,
    required this.password,
    required this.experience,
    this.profileImage,
    required this.maritalStatus,
    required this.salary,
  });

  factory Teacher({
    int? id,
    required String teacherName,
    required String department,
    required String designation,
    required String qualification,
    required DateTime joiningDate,
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
    required String permanentAddress,
    required String registration,
    required String password,
    required int experience,
    String? profileImage,
    required String maritalStatus,
    required double salary,
  }) = _TeacherImpl;

  factory Teacher.fromJson(Map<String, dynamic> jsonSerialization) {
    return Teacher(
      id: jsonSerialization['id'] as int?,
      teacherName: jsonSerialization['teacherName'] as String,
      department: jsonSerialization['department'] as String,
      designation: jsonSerialization['designation'] as String,
      qualification: jsonSerialization['qualification'] as String,
      joiningDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['joiningDate'],
      ),
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
      permanentAddress: jsonSerialization['permanentAddress'] as String,
      registration: jsonSerialization['registration'] as String,
      password: jsonSerialization['password'] as String,
      experience: jsonSerialization['experience'] as int,
      profileImage: jsonSerialization['profileImage'] as String?,
      maritalStatus: jsonSerialization['maritalStatus'] as String,
      salary: (jsonSerialization['salary'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String teacherName;

  String department;

  String designation;

  String qualification;

  DateTime joiningDate;

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

  String permanentAddress;

  String registration;

  String password;

  int experience;

  String? profileImage;

  String maritalStatus;

  double salary;

  /// Returns a shallow copy of this [Teacher]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Teacher copyWith({
    int? id,
    String? teacherName,
    String? department,
    String? designation,
    String? qualification,
    DateTime? joiningDate,
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
    String? permanentAddress,
    String? registration,
    String? password,
    int? experience,
    String? profileImage,
    String? maritalStatus,
    double? salary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Teacher',
      if (id != null) 'id': id,
      'teacherName': teacherName,
      'department': department,
      'designation': designation,
      'qualification': qualification,
      'joiningDate': joiningDate.toJson(),
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
      'permanentAddress': permanentAddress,
      'registration': registration,
      'password': password,
      'experience': experience,
      if (profileImage != null) 'profileImage': profileImage,
      'maritalStatus': maritalStatus,
      'salary': salary,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeacherImpl extends Teacher {
  _TeacherImpl({
    int? id,
    required String teacherName,
    required String department,
    required String designation,
    required String qualification,
    required DateTime joiningDate,
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
    required String permanentAddress,
    required String registration,
    required String password,
    required int experience,
    String? profileImage,
    required String maritalStatus,
    required double salary,
  }) : super._(
         id: id,
         teacherName: teacherName,
         department: department,
         designation: designation,
         qualification: qualification,
         joiningDate: joiningDate,
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
         permanentAddress: permanentAddress,
         registration: registration,
         password: password,
         experience: experience,
         profileImage: profileImage,
         maritalStatus: maritalStatus,
         salary: salary,
       );

  /// Returns a shallow copy of this [Teacher]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Teacher copyWith({
    Object? id = _Undefined,
    String? teacherName,
    String? department,
    String? designation,
    String? qualification,
    DateTime? joiningDate,
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
    String? permanentAddress,
    String? registration,
    String? password,
    int? experience,
    Object? profileImage = _Undefined,
    String? maritalStatus,
    double? salary,
  }) {
    return Teacher(
      id: id is int? ? id : this.id,
      teacherName: teacherName ?? this.teacherName,
      department: department ?? this.department,
      designation: designation ?? this.designation,
      qualification: qualification ?? this.qualification,
      joiningDate: joiningDate ?? this.joiningDate,
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
      permanentAddress: permanentAddress ?? this.permanentAddress,
      registration: registration ?? this.registration,
      password: password ?? this.password,
      experience: experience ?? this.experience,
      profileImage: profileImage is String? ? profileImage : this.profileImage,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      salary: salary ?? this.salary,
    );
  }
}
