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

abstract class Student
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = StudentTable();

  static const db = StudentRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static StudentInclude include() {
    return StudentInclude._();
  }

  static StudentIncludeList includeList({
    _i1.WhereExpressionBuilder<StudentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudentTable>? orderByList,
    StudentInclude? include,
  }) {
    return StudentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Student.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Student.t),
      include: include,
    );
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

class StudentUpdateTable extends _i1.UpdateTable<StudentTable> {
  StudentUpdateTable(super.table);

  _i1.ColumnValue<String, String> academicYear(String value) => _i1.ColumnValue(
    table.academicYear,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> admissionDate(DateTime value) =>
      _i1.ColumnValue(
        table.admissionDate,
        value,
      );

  _i1.ColumnValue<String, String> studentName(String value) => _i1.ColumnValue(
    table.studentName,
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

  _i1.ColumnValue<String, String> studentClass(String value) => _i1.ColumnValue(
    table.studentClass,
    value,
  );

  _i1.ColumnValue<String, String> section(String value) => _i1.ColumnValue(
    table.section,
    value,
  );

  _i1.ColumnValue<String, String> roll(String value) => _i1.ColumnValue(
    table.roll,
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
}

class StudentTable extends _i1.Table<int?> {
  StudentTable({super.tableRelation}) : super(tableName: 'student') {
    updateTable = StudentUpdateTable(this);
    academicYear = _i1.ColumnString(
      'academicYear',
      this,
    );
    admissionDate = _i1.ColumnDateTime(
      'admissionDate',
      this,
    );
    studentName = _i1.ColumnString(
      'studentName',
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
    studentClass = _i1.ColumnString(
      'studentClass',
      this,
    );
    section = _i1.ColumnString(
      'section',
      this,
    );
    roll = _i1.ColumnString(
      'roll',
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
  }

  late final StudentUpdateTable updateTable;

  late final _i1.ColumnString academicYear;

  late final _i1.ColumnDateTime admissionDate;

  late final _i1.ColumnString studentName;

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

  late final _i1.ColumnString studentClass;

  late final _i1.ColumnString section;

  late final _i1.ColumnString roll;

  late final _i1.ColumnString registration;

  late final _i1.ColumnString password;

  @override
  List<_i1.Column> get columns => [
    id,
    academicYear,
    admissionDate,
    studentName,
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
    studentClass,
    section,
    roll,
    registration,
    password,
  ];
}

class StudentInclude extends _i1.IncludeObject {
  StudentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Student.t;
}

class StudentIncludeList extends _i1.IncludeList {
  StudentIncludeList._({
    _i1.WhereExpressionBuilder<StudentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Student.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Student.t;
}

class StudentRepository {
  const StudentRepository._();

  /// Returns a list of [Student]s matching the given query parameters.
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
  Future<List<Student>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StudentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Student>(
      where: where?.call(Student.t),
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Student] matching the given query parameters.
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
  Future<Student?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StudentTable>? where,
    int? offset,
    _i1.OrderByBuilder<StudentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Student>(
      where: where?.call(Student.t),
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Student] by its [id] or null if no such row exists.
  Future<Student?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Student>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Student]s in the list and returns the inserted rows.
  ///
  /// The returned [Student]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Student>> insert(
    _i1.Session session,
    List<Student> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Student>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Student] and returns the inserted row.
  ///
  /// The returned [Student] will have its `id` field set.
  Future<Student> insertRow(
    _i1.Session session,
    Student row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Student>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Student]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Student>> update(
    _i1.Session session,
    List<Student> rows, {
    _i1.ColumnSelections<StudentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Student>(
      rows,
      columns: columns?.call(Student.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Student]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Student> updateRow(
    _i1.Session session,
    Student row, {
    _i1.ColumnSelections<StudentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Student>(
      row,
      columns: columns?.call(Student.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Student] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Student?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<StudentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Student>(
      id,
      columnValues: columnValues(Student.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Student]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Student>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<StudentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StudentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudentTable>? orderBy,
    _i1.OrderByListBuilder<StudentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Student>(
      columnValues: columnValues(Student.t.updateTable),
      where: where(Student.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Student]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Student>> delete(
    _i1.Session session,
    List<Student> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Student>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Student].
  Future<Student> deleteRow(
    _i1.Session session,
    Student row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Student>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Student>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StudentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Student>(
      where: where(Student.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StudentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Student>(
      where: where?.call(Student.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
