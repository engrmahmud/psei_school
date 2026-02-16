import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/create_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/delete_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/get_all_teachers.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/get_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/search_teachers.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/update_teacher.dart';
import 'teacher_event.dart';
import 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final GetAllTeachersUseCase getAllTeachers;
  final GetTeacherUseCase getTeacher;
  final CreateTeacherUseCase createTeacher;
  final UpdateTeacherUseCase updateTeacher;
  final DeleteTeacherUseCase deleteTeacher;
  final SearchTeachersUseCase searchTeachers;

  TeacherBloc({
    required this.getAllTeachers,
    required this.getTeacher,
    required this.createTeacher,
    required this.updateTeacher,
    required this.deleteTeacher,
    required this.searchTeachers,
  }) : super(TeacherInitial()) {
    on<LoadTeachers>(_onLoadTeachers);
    on<GetTeacherById>(_onGetTeacherById);
    on<CreateTeacher>(_onCreateTeacher);
    on<UpdateTeacher>(_onUpdateTeacher);
    on<DeleteTeacher>(_onDeleteTeacher);
    on<SearchTeachers>(_onSearchTeachers);
  }

  Future<void> _onLoadTeachers(
      LoadTeachers event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final result = await getAllTeachers(NoParams());
    result.match(
      (failure) {
        debugPrint('LoadTeachers Error: ${failure.message}');
        emit(TeacherError(failure.message));
      },
      (teachers) {
        debugPrint('LoadTeachers Success: ${teachers.length} teachers found');
        emit(TeacherLoaded(teachers));
      },
    );
  }

  Future<void> _onGetTeacherById(
      GetTeacherById event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final result = await getTeacher(GetTeacherParams(event.id));
    result.match(
      (failure) => emit(TeacherError(failure.message)),
      (teacher) => emit(TeacherLoaded([teacher])),
    );
  }

  Future<void> _onCreateTeacher(
      CreateTeacher event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final result = await createTeacher(CreateTeacherParams(event.teacher));
    result.match(
      (failure) => emit(TeacherError(failure.message)),
      (_) => emit(TeacherSuccess('Teacher created successfully')),
    );
  }

  Future<void> _onUpdateTeacher(
      UpdateTeacher event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final result =
        await updateTeacher(UpdateTeacherParams(event.id, event.teacher));
    result.match(
      (failure) => emit(TeacherError(failure.message)),
      (_) => emit(TeacherSuccess('Teacher updated successfully')),
    );
  }

  Future<void> _onDeleteTeacher(
      DeleteTeacher event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final result = await deleteTeacher(DeleteTeacherParams(event.id));
    result.match(
      (failure) => emit(TeacherError(failure.message)),
      (_) => emit(TeacherSuccess('Teacher deleted successfully')),
    );
  }

  Future<void> _onSearchTeachers(
      SearchTeachers event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final result = await searchTeachers(SearchTeacherParams(
      name: event.name,
      id: event.id,
      department: event.department,
      designation: event.designation,
    ));
    result.match(
      (failure) {
        debugPrint('SearchTeachers Error: ${failure.message}');
        emit(TeacherError(failure.message));
      },
      (teachers) {
        debugPrint('SearchTeachers Success: ${teachers.length} teachers found');
        emit(TeacherLoaded(teachers));
      },
    );
  }
}

