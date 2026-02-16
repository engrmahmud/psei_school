import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/create_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/delete_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/get_all_students.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/get_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/search_students.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/update_student.dart';
import 'student_event.dart';
import 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final GetAllStudentsUseCase getAllStudents;
  final GetStudentUseCase getStudent;
  final CreateStudentUseCase createStudent;
  final UpdateStudentUseCase updateStudent;
  final DeleteStudentUseCase deleteStudent;
  final SearchStudentsUseCase searchStudents;

  StudentBloc({
    required this.getAllStudents,
    required this.getStudent,
    required this.createStudent,
    required this.updateStudent,
    required this.deleteStudent,
    required this.searchStudents,
  }) : super(StudentInitial()) {
    on<LoadStudents>(_onLoadStudents);
    on<GetStudentById>(_onGetStudentById);
    on<CreateStudent>(_onCreateStudent);
    on<UpdateStudent>(_onUpdateStudent);
    on<DeleteStudent>(_onDeleteStudent);
    on<SearchStudents>(_onSearchStudents);
  }

  Future<void> _onLoadStudents(
      LoadStudents event, Emitter<StudentState> emit) async {
    emit(StudentLoading());
    final result = await getAllStudents(NoParams()); 
    result.match(
      (failure) {
        // Log the full error for debugging
        debugPrint('LoadStudents Error: ${failure.message}');
        emit(StudentError(failure.message));
      },
      (students) {
        // Log for debugging
        debugPrint('LoadStudents Success: ${students.length} students found');
        emit(StudentLoaded(students));
      },
    );
  }

  Future<void> _onGetStudentById(
      GetStudentById event, Emitter<StudentState> emit) async {
    emit(StudentLoading());
    final result = await getStudent(GetStudentParams(event.id));
    result.match(
      (failure) => emit(StudentError(failure.message)),
      (student) => emit(StudentLoaded([student])),
    );
  }

  Future<void> _onCreateStudent(
      CreateStudent event, Emitter<StudentState> emit) async {
    emit(StudentLoading());
    final result = await createStudent(CreateStudentParams(event.student));
    result.match(
      (failure) => emit(StudentError(failure.message)),
      (_) => emit(StudentSuccess('Student created successfully')),
    );
  }

  Future<void> _onUpdateStudent(
      UpdateStudent event, Emitter<StudentState> emit) async {
    emit(StudentLoading());
    final result =
        await updateStudent(UpdateStudentParams(event.id, event.student));
    result.match(
      (failure) => emit(StudentError(failure.message)),
      (_) => emit(StudentSuccess('Student updated successfully')),
    );
  }

  Future<void> _onDeleteStudent(
      DeleteStudent event, Emitter<StudentState> emit) async {
    emit(StudentLoading());
    final result = await deleteStudent(DeleteStudentParams(event.id));
    result.match(
      (failure) => emit(StudentError(failure.message)),
      (_) => emit(StudentSuccess('Student deleted successfully')),
    );
  }

  Future<void> _onSearchStudents(
      SearchStudents event, Emitter<StudentState> emit) async {
    emit(StudentLoading());
    final result = await searchStudents(SearchStudentParams(
      name: event.name,
      id: event.id,
      roll: event.roll,
      registration: event.registration,
      studentClass: event.studentClass,
    ));
    result.match(
      (failure) {
        debugPrint('SearchStudents Error: ${failure.message}');
        emit(StudentError(failure.message));
      },
      (students) {
        debugPrint('SearchStudents Success: ${students.length} students found');
        emit(StudentLoaded(students));
      },
    );
  }
}
