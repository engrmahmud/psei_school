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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Teacher
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TeacherTable();

  static const db = TeacherRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static TeacherInclude include() {
    return TeacherInclude._();
  }

  static TeacherIncludeList includeList({
    _i1.WhereExpressionBuilder<TeacherTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeacherTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeacherTable>? orderByList,
    TeacherInclude? include,
  }) {
    return TeacherIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Teacher.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Teacher.t),
      include: include,
    );
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

class TeacherUpdateTable extends _i1.UpdateTable<TeacherTable> {
  TeacherUpdateTable(super.table);

  _i1.ColumnValue<String, String> teacherName(String value) => _i1.ColumnValue(
    table.teacherName,
    value,
  );

  _i1.ColumnValue<String, String> department(String value) => _i1.ColumnValue(
    table.department,
    value,
  );

  _i1.ColumnValue<String, String> designation(String value) => _i1.ColumnValue(
    table.designation,
    value,
  );

  _i1.ColumnValue<String, String> qualification(String value) =>
      _i1.ColumnValue(
        table.qualification,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> joiningDate(DateTime value) =>
      _i1.ColumnValue(
        table.joiningDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateOfBirth(DateTime value) =>
      _i1.ColumnValue(
        table.dateOfBirth,
        value,
      );

  _i1.ColumnValue<String, String> gender(String value) => _i1.ColumnValue(
    table.gender,
    value,
  );

  _i1.ColumnValue<String, String> religion(String value) => _i1.ColumnValue(
    table.religion,
    value,
  );

  _i1.ColumnValue<String, String> bloodGroup(String value) => _i1.ColumnValue(
    table.bloodGroup,
    value,
  );

  _i1.ColumnValue<String, String> nationality(String value) => _i1.ColumnValue(
    table.nationality,
    value,
  );

  _i1.ColumnValue<String, String> fatherName(String value) => _i1.ColumnValue(
    table.fatherName,
    value,
  );

  _i1.ColumnValue<String, String> motherName(String value) => _i1.ColumnValue(
    table.motherName,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> address(String value) => _i1.ColumnValue(
    table.address,
    value,
  );

  _i1.ColumnValue<String, String> permanentAddress(String value) =>
      _i1.ColumnValue(
        table.permanentAddress,
        value,
      );

  _i1.ColumnValue<String, String> registration(String value) => _i1.ColumnValue(
    table.registration,
    value,
  );

  _i1.ColumnValue<String, String> password(String value) => _i1.ColumnValue(
    table.password,
    value,
  );

  _i1.ColumnValue<int, int> experience(int value) => _i1.ColumnValue(
    table.experience,
    value,
  );

  _i1.ColumnValue<String, String> profileImage(String? value) =>
      _i1.ColumnValue(
        table.profileImage,
        value,
      );

  _i1.ColumnValue<String, String> maritalStatus(String value) =>
      _i1.ColumnValue(
        table.maritalStatus,
        value,
      );

  _i1.ColumnValue<double, double> salary(double value) => _i1.ColumnValue(
    table.salary,
    value,
  );
}

class TeacherTable extends _i1.Table<int?> {
  TeacherTable({super.tableRelation}) : super(tableName: 'teacher') {
    updateTable = TeacherUpdateTable(this);
    teacherName = _i1.ColumnString(
      'teacherName',
      this,
    );
    department = _i1.ColumnString(
      'department',
      this,
    );
    designation = _i1.ColumnString(
      'designation',
      this,
    );
    qualification = _i1.ColumnString(
      'qualification',
      this,
    );
    joiningDate = _i1.ColumnDateTime(
      'joiningDate',
      this,
    );
    dateOfBirth = _i1.ColumnDateTime(
      'dateOfBirth',
      this,
    );
    gender = _i1.ColumnString(
      'gender',
      this,
    );
    religion = _i1.ColumnString(
      'religion',
      this,
    );
    bloodGroup = _i1.ColumnString(
      'bloodGroup',
      this,
    );
    nationality = _i1.ColumnString(
      'nationality',
      this,
    );
    fatherName = _i1.ColumnString(
      'fatherName',
      this,
    );
    motherName = _i1.ColumnString(
      'motherName',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    permanentAddress = _i1.ColumnString(
      'permanentAddress',
      this,
    );
    registration = _i1.ColumnString(
      'registration',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    experience = _i1.ColumnInt(
      'experience',
      this,
    );
    profileImage = _i1.ColumnString(
      'profileImage',
      this,
    );
    maritalStatus = _i1.ColumnString(
      'maritalStatus',
      this,
    );
    salary = _i1.ColumnDouble(
      'salary',
      this,
    );
  }

  late final TeacherUpdateTable updateTable;

  late final _i1.ColumnString teacherName;

  late final _i1.ColumnString department;

  late final _i1.ColumnString designation;

  late final _i1.ColumnString qualification;

  late final _i1.ColumnDateTime joiningDate;

  late final _i1.ColumnDateTime dateOfBirth;

  late final _i1.ColumnString gender;

  late final _i1.ColumnString religion;

  late final _i1.ColumnString bloodGroup;

  late final _i1.ColumnString nationality;

  late final _i1.ColumnString fatherName;

  late final _i1.ColumnString motherName;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString address;

  late final _i1.ColumnString permanentAddress;

  late final _i1.ColumnString registration;

  late final _i1.ColumnString password;

  late final _i1.ColumnInt experience;

  late final _i1.ColumnString profileImage;

  late final _i1.ColumnString maritalStatus;

  late final _i1.ColumnDouble salary;

  @override
  List<_i1.Column> get columns => [
    id,
    teacherName,
    department,
    designation,
    qualification,
    joiningDate,
    dateOfBirth,
    gender,
    religion,
    bloodGroup,
    nationality,
    fatherName,
    motherName,
    email,
    phone,
    address,
    permanentAddress,
    registration,
    password,
    experience,
    profileImage,
    maritalStatus,
    salary,
  ];
}

class TeacherInclude extends _i1.IncludeObject {
  TeacherInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Teacher.t;
}

class TeacherIncludeList extends _i1.IncludeList {
  TeacherIncludeList._({
    _i1.WhereExpressionBuilder<TeacherTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Teacher.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Teacher.t;
}

class TeacherRepository {
  const TeacherRepository._();

  /// Returns a list of [Teacher]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Teacher>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeacherTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeacherTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeacherTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Teacher>(
      where: where?.call(Teacher.t),
      orderBy: orderBy?.call(Teacher.t),
      orderByList: orderByList?.call(Teacher.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Teacher] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Teacher?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeacherTable>? where,
    int? offset,
    _i1.OrderByBuilder<TeacherTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeacherTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Teacher>(
      where: where?.call(Teacher.t),
      orderBy: orderBy?.call(Teacher.t),
      orderByList: orderByList?.call(Teacher.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Teacher] by its [id] or null if no such row exists.
  Future<Teacher?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Teacher>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Teacher]s in the list and returns the inserted rows.
  ///
  /// The returned [Teacher]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Teacher>> insert(
    _i1.Session session,
    List<Teacher> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Teacher>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Teacher] and returns the inserted row.
  ///
  /// The returned [Teacher] will have its `id` field set.
  Future<Teacher> insertRow(
    _i1.Session session,
    Teacher row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Teacher>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Teacher]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Teacher>> update(
    _i1.Session session,
    List<Teacher> rows, {
    _i1.ColumnSelections<TeacherTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Teacher>(
      rows,
      columns: columns?.call(Teacher.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Teacher]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Teacher> updateRow(
    _i1.Session session,
    Teacher row, {
    _i1.ColumnSelections<TeacherTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Teacher>(
      row,
      columns: columns?.call(Teacher.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Teacher] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Teacher?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TeacherUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Teacher>(
      id,
      columnValues: columnValues(Teacher.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Teacher]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Teacher>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TeacherUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TeacherTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeacherTable>? orderBy,
    _i1.OrderByListBuilder<TeacherTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Teacher>(
      columnValues: columnValues(Teacher.t.updateTable),
      where: where(Teacher.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Teacher.t),
      orderByList: orderByList?.call(Teacher.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Teacher]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Teacher>> delete(
    _i1.Session session,
    List<Teacher> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Teacher>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Teacher].
  Future<Teacher> deleteRow(
    _i1.Session session,
    Teacher row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Teacher>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Teacher>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeacherTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Teacher>(
      where: where(Teacher.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeacherTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Teacher>(
      where: where?.call(Teacher.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
