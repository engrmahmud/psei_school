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

abstract class Admin implements _i1.SerializableModel {
  Admin._({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.createdAt,
  });

  factory Admin({
    int? id,
    required String email,
    required String password,
    required String name,
    required DateTime createdAt,
  }) = _AdminImpl;

  factory Admin.fromJson(Map<String, dynamic> jsonSerialization) {
    return Admin(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      name: jsonSerialization['name'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String password;

  String name;

  DateTime createdAt;

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Admin copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Admin',
      if (id != null) 'id': id,
      'email': email,
      'password': password,
      'name': name,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminImpl extends Admin {
  _AdminImpl({
    int? id,
    required String email,
    required String password,
    required String name,
    required DateTime createdAt,
  }) : super._(
         id: id,
         email: email,
         password: password,
         name: name,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Admin copyWith({
    Object? id = _Undefined,
    String? email,
    String? password,
    String? name,
    DateTime? createdAt,
  }) {
    return Admin(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
