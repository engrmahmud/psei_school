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

abstract class TeacherCourse
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TeacherCourseTable();

  static const db = TeacherCourseRepository._();

  @override
  int? id;

  int teacherId;

  int courseId;

  DateTime assignedDate;

  String? role;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TeacherCourse',
      if (id != null) 'id': id,
      'teacherId': teacherId,
      'courseId': courseId,
      'assignedDate': assignedDate.toJson(),
      if (role != null) 'role': role,
    };
  }

  static TeacherCourseInclude include() {
    return TeacherCourseInclude._();
  }

  static TeacherCourseIncludeList includeList({
    _i1.WhereExpressionBuilder<TeacherCourseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeacherCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeacherCourseTable>? orderByList,
    TeacherCourseInclude? include,
  }) {
    return TeacherCourseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeacherCourse.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TeacherCourse.t),
      include: include,
    );
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

class TeacherCourseUpdateTable extends _i1.UpdateTable<TeacherCourseTable> {
  TeacherCourseUpdateTable(super.table);

  _i1.ColumnValue<int, int> teacherId(int value) => _i1.ColumnValue(
    table.teacherId,
    value,
  );

  _i1.ColumnValue<int, int> courseId(int value) => _i1.ColumnValue(
    table.courseId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> assignedDate(DateTime value) =>
      _i1.ColumnValue(
        table.assignedDate,
        value,
      );

  _i1.ColumnValue<String, String> role(String? value) => _i1.ColumnValue(
    table.role,
    value,
  );
}

class TeacherCourseTable extends _i1.Table<int?> {
  TeacherCourseTable({super.tableRelation})
    : super(tableName: 'teacher_course') {
    updateTable = TeacherCourseUpdateTable(this);
    teacherId = _i1.ColumnInt(
      'teacherId',
      this,
    );
    courseId = _i1.ColumnInt(
      'courseId',
      this,
    );
    assignedDate = _i1.ColumnDateTime(
      'assignedDate',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
  }

  late final TeacherCourseUpdateTable updateTable;

  late final _i1.ColumnInt teacherId;

  late final _i1.ColumnInt courseId;

  late final _i1.ColumnDateTime assignedDate;

  late final _i1.ColumnString role;

  @override
  List<_i1.Column> get columns => [
    id,
    teacherId,
    courseId,
    assignedDate,
    role,
  ];
}

class TeacherCourseInclude extends _i1.IncludeObject {
  TeacherCourseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TeacherCourse.t;
}

class TeacherCourseIncludeList extends _i1.IncludeList {
  TeacherCourseIncludeList._({
    _i1.WhereExpressionBuilder<TeacherCourseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TeacherCourse.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TeacherCourse.t;
}

class TeacherCourseRepository {
  const TeacherCourseRepository._();

  /// Returns a list of [TeacherCourse]s matching the given query parameters.
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
  Future<List<TeacherCourse>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeacherCourseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeacherCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeacherCourseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TeacherCourse>(
      where: where?.call(TeacherCourse.t),
      orderBy: orderBy?.call(TeacherCourse.t),
      orderByList: orderByList?.call(TeacherCourse.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TeacherCourse] matching the given query parameters.
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
  Future<TeacherCourse?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeacherCourseTable>? where,
    int? offset,
    _i1.OrderByBuilder<TeacherCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeacherCourseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TeacherCourse>(
      where: where?.call(TeacherCourse.t),
      orderBy: orderBy?.call(TeacherCourse.t),
      orderByList: orderByList?.call(TeacherCourse.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TeacherCourse] by its [id] or null if no such row exists.
  Future<TeacherCourse?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TeacherCourse>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TeacherCourse]s in the list and returns the inserted rows.
  ///
  /// The returned [TeacherCourse]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TeacherCourse>> insert(
    _i1.Session session,
    List<TeacherCourse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TeacherCourse>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TeacherCourse] and returns the inserted row.
  ///
  /// The returned [TeacherCourse] will have its `id` field set.
  Future<TeacherCourse> insertRow(
    _i1.Session session,
    TeacherCourse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TeacherCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TeacherCourse]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TeacherCourse>> update(
    _i1.Session session,
    List<TeacherCourse> rows, {
    _i1.ColumnSelections<TeacherCourseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TeacherCourse>(
      rows,
      columns: columns?.call(TeacherCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TeacherCourse]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TeacherCourse> updateRow(
    _i1.Session session,
    TeacherCourse row, {
    _i1.ColumnSelections<TeacherCourseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TeacherCourse>(
      row,
      columns: columns?.call(TeacherCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TeacherCourse] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TeacherCourse?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TeacherCourseUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TeacherCourse>(
      id,
      columnValues: columnValues(TeacherCourse.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TeacherCourse]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TeacherCourse>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TeacherCourseUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TeacherCourseTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeacherCourseTable>? orderBy,
    _i1.OrderByListBuilder<TeacherCourseTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TeacherCourse>(
      columnValues: columnValues(TeacherCourse.t.updateTable),
      where: where(TeacherCourse.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeacherCourse.t),
      orderByList: orderByList?.call(TeacherCourse.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TeacherCourse]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TeacherCourse>> delete(
    _i1.Session session,
    List<TeacherCourse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TeacherCourse>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TeacherCourse].
  Future<TeacherCourse> deleteRow(
    _i1.Session session,
    TeacherCourse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TeacherCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TeacherCourse>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeacherCourseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TeacherCourse>(
      where: where(TeacherCourse.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeacherCourseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TeacherCourse>(
      where: where?.call(TeacherCourse.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
