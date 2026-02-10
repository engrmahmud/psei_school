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

abstract class StudentCourse
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = StudentCourseTable();

  static const db = StudentCourseRepository._();

  @override
  int? id;

  int studentId;

  int courseId;

  double? marks;

  DateTime enrollmentDate;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StudentCourse',
      if (id != null) 'id': id,
      'studentId': studentId,
      'courseId': courseId,
      if (marks != null) 'marks': marks,
      'enrollmentDate': enrollmentDate.toJson(),
    };
  }

  static StudentCourseInclude include() {
    return StudentCourseInclude._();
  }

  static StudentCourseIncludeList includeList({
    _i1.WhereExpressionBuilder<StudentCourseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudentCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudentCourseTable>? orderByList,
    StudentCourseInclude? include,
  }) {
    return StudentCourseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudentCourse.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StudentCourse.t),
      include: include,
    );
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

class StudentCourseUpdateTable extends _i1.UpdateTable<StudentCourseTable> {
  StudentCourseUpdateTable(super.table);

  _i1.ColumnValue<int, int> studentId(int value) => _i1.ColumnValue(
    table.studentId,
    value,
  );

  _i1.ColumnValue<int, int> courseId(int value) => _i1.ColumnValue(
    table.courseId,
    value,
  );

  _i1.ColumnValue<double, double> marks(double? value) => _i1.ColumnValue(
    table.marks,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> enrollmentDate(DateTime value) =>
      _i1.ColumnValue(
        table.enrollmentDate,
        value,
      );
}

class StudentCourseTable extends _i1.Table<int?> {
  StudentCourseTable({super.tableRelation})
    : super(tableName: 'student_course') {
    updateTable = StudentCourseUpdateTable(this);
    studentId = _i1.ColumnInt(
      'studentId',
      this,
    );
    courseId = _i1.ColumnInt(
      'courseId',
      this,
    );
    marks = _i1.ColumnDouble(
      'marks',
      this,
    );
    enrollmentDate = _i1.ColumnDateTime(
      'enrollmentDate',
      this,
    );
  }

  late final StudentCourseUpdateTable updateTable;

  late final _i1.ColumnInt studentId;

  late final _i1.ColumnInt courseId;

  late final _i1.ColumnDouble marks;

  late final _i1.ColumnDateTime enrollmentDate;

  @override
  List<_i1.Column> get columns => [
    id,
    studentId,
    courseId,
    marks,
    enrollmentDate,
  ];
}

class StudentCourseInclude extends _i1.IncludeObject {
  StudentCourseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StudentCourse.t;
}

class StudentCourseIncludeList extends _i1.IncludeList {
  StudentCourseIncludeList._({
    _i1.WhereExpressionBuilder<StudentCourseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StudentCourse.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StudentCourse.t;
}

class StudentCourseRepository {
  const StudentCourseRepository._();

  /// Returns a list of [StudentCourse]s matching the given query parameters.
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
  Future<List<StudentCourse>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StudentCourseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudentCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudentCourseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<StudentCourse>(
      where: where?.call(StudentCourse.t),
      orderBy: orderBy?.call(StudentCourse.t),
      orderByList: orderByList?.call(StudentCourse.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [StudentCourse] matching the given query parameters.
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
  Future<StudentCourse?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StudentCourseTable>? where,
    int? offset,
    _i1.OrderByBuilder<StudentCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudentCourseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<StudentCourse>(
      where: where?.call(StudentCourse.t),
      orderBy: orderBy?.call(StudentCourse.t),
      orderByList: orderByList?.call(StudentCourse.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [StudentCourse] by its [id] or null if no such row exists.
  Future<StudentCourse?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<StudentCourse>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [StudentCourse]s in the list and returns the inserted rows.
  ///
  /// The returned [StudentCourse]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<StudentCourse>> insert(
    _i1.Session session,
    List<StudentCourse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<StudentCourse>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [StudentCourse] and returns the inserted row.
  ///
  /// The returned [StudentCourse] will have its `id` field set.
  Future<StudentCourse> insertRow(
    _i1.Session session,
    StudentCourse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StudentCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StudentCourse]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StudentCourse>> update(
    _i1.Session session,
    List<StudentCourse> rows, {
    _i1.ColumnSelections<StudentCourseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StudentCourse>(
      rows,
      columns: columns?.call(StudentCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudentCourse]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StudentCourse> updateRow(
    _i1.Session session,
    StudentCourse row, {
    _i1.ColumnSelections<StudentCourseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StudentCourse>(
      row,
      columns: columns?.call(StudentCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudentCourse] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StudentCourse?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<StudentCourseUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StudentCourse>(
      id,
      columnValues: columnValues(StudentCourse.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StudentCourse]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StudentCourse>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<StudentCourseUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StudentCourseTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudentCourseTable>? orderBy,
    _i1.OrderByListBuilder<StudentCourseTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StudentCourse>(
      columnValues: columnValues(StudentCourse.t.updateTable),
      where: where(StudentCourse.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudentCourse.t),
      orderByList: orderByList?.call(StudentCourse.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StudentCourse]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StudentCourse>> delete(
    _i1.Session session,
    List<StudentCourse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StudentCourse>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StudentCourse].
  Future<StudentCourse> deleteRow(
    _i1.Session session,
    StudentCourse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StudentCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StudentCourse>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StudentCourseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StudentCourse>(
      where: where(StudentCourse.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StudentCourseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StudentCourse>(
      where: where?.call(StudentCourse.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
