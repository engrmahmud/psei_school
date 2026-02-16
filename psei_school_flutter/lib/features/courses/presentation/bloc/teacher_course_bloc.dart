import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/assign_teacher_to_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_teachers_by_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/unassign_teacher_from_course.dart';
import 'teacher_course_event.dart';
import 'teacher_course_state.dart';

class TeacherCourseBloc extends Bloc<TeacherCourseEvent, TeacherCourseState> {
  final GetTeachersByCourseUseCase getTeachersByCourse;
  final AssignTeacherToCourseUseCase assignTeacherToCourse;
  final UnassignTeacherFromCourseUseCase unassignTeacherFromCourse;

  TeacherCourseBloc({
    required this.getTeachersByCourse,
    required this.assignTeacherToCourse,
    required this.unassignTeacherFromCourse,
  }) : super(TeacherCourseInitial()) {
    on<LoadTeachersByCourse>(_onLoadTeachersByCourse);
    on<AssignTeacherToCourse>(_onAssignTeacherToCourse);
    on<UnassignTeacherFromCourse>(_onUnassignTeacherFromCourse);
  }

  Future<void> _onLoadTeachersByCourse(
    LoadTeachersByCourse event,
    Emitter<TeacherCourseState> emit,
  ) async {
    emit(TeacherCourseLoading());
    final result = await getTeachersByCourse(
      GetTeachersByCourseParams(courseId: event.courseId),
    );
    result.match(
      (failure) {
        debugPrint('LoadTeachersByCourse Error: ${failure.message}');
        emit(TeacherCourseError(failure.message));
      },
      (teachers) {
        debugPrint('LoadTeachersByCourse Success: ${teachers.length} teachers found');
        emit(TeacherCourseLoaded(teachers: teachers, courseId: event.courseId));
      },
    );
  }

  Future<void> _onAssignTeacherToCourse(
    AssignTeacherToCourse event,
    Emitter<TeacherCourseState> emit,
  ) async {
    emit(TeacherCourseLoading());
    final result = await assignTeacherToCourse(
      AssignTeacherToCourseParams(
        teacherId: event.teacherId,
        courseId: event.courseId,
        role: event.role,
      ),
    );
    result.match(
      (failure) {
        debugPrint('AssignTeacherToCourse Error: ${failure.message}');
        emit(TeacherCourseError(failure.message));
      },
      (teacherCourse) {
        debugPrint('AssignTeacherToCourse Success: teacher assigned');
        emit(TeacherCourseAssigned(teacherCourse));
        // Reload teachers after successful assignment
        add(LoadTeachersByCourse(event.courseId));
      },
    );
  }

  Future<void> _onUnassignTeacherFromCourse(
    UnassignTeacherFromCourse event,
    Emitter<TeacherCourseState> emit,
  ) async {
    emit(TeacherCourseLoading());
    final result = await unassignTeacherFromCourse(
      UnassignTeacherFromCourseParams(
        teacherId: event.teacherId,
        courseId: event.courseId,
      ),
    );
    result.match(
      (failure) {
        debugPrint('UnassignTeacherFromCourse Error: ${failure.message}');
        emit(TeacherCourseError(failure.message));
      },
      (success) {
        debugPrint('UnassignTeacherFromCourse Success');
        emit(const TeacherCourseUnassigned('Teacher unassigned successfully'));
        // Reload teachers after successful unassignment
        add(LoadTeachersByCourse(event.courseId));
      },
    );
  }
}

