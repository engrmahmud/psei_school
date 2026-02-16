import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/assign_student_to_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_students_by_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/unassign_student_from_course.dart';
import 'student_course_event.dart';
import 'student_course_state.dart';

class StudentCourseBloc extends Bloc<StudentCourseEvent, StudentCourseState> {
  final GetStudentsByCourseUseCase getStudentsByCourse;
  final AssignStudentToCourseUseCase assignStudentToCourse;
  final UnassignStudentFromCourseUseCase unassignStudentFromCourse;

  StudentCourseBloc({
    required this.getStudentsByCourse,
    required this.assignStudentToCourse,
    required this.unassignStudentFromCourse,
  }) : super(StudentCourseInitial()) {
    on<LoadStudentsByCourse>(_onLoadStudentsByCourse);
    on<AssignStudentToCourse>(_onAssignStudentToCourse);
    on<UnassignStudentFromCourse>(_onUnassignStudentFromCourse);
  }

  Future<void> _onLoadStudentsByCourse(
    LoadStudentsByCourse event,
    Emitter<StudentCourseState> emit,
  ) async {
    emit(StudentCourseLoading());
    final result = await getStudentsByCourse(
      GetStudentsByCourseParams(courseId: event.courseId),
    );
    result.match(
      (failure) {
        debugPrint('LoadStudentsByCourse Error: ${failure.message}');
        emit(StudentCourseError(failure.message));
      },
      (students) {
        debugPrint('LoadStudentsByCourse Success: ${students.length} students found');
        emit(StudentCourseLoaded(students: students, courseId: event.courseId));
      },
    );
  }

  Future<void> _onAssignStudentToCourse(
    AssignStudentToCourse event,
    Emitter<StudentCourseState> emit,
  ) async {
    emit(StudentCourseLoading());
    final result = await assignStudentToCourse(
      AssignStudentToCourseParams(
        studentId: event.studentId,
        courseId: event.courseId,
      ),
    );
    result.match(
      (failure) {
        debugPrint('AssignStudentToCourse Error: ${failure.message}');
        emit(StudentCourseError(failure.message));
      },
      (studentCourse) {
        debugPrint('AssignStudentToCourse Success: student assigned');
        emit(StudentCourseAssigned(studentCourse));
        // Reload students after successful assignment
        add(LoadStudentsByCourse(event.courseId));
      },
    );
  }

  Future<void> _onUnassignStudentFromCourse(
    UnassignStudentFromCourse event,
    Emitter<StudentCourseState> emit,
  ) async {
    emit(StudentCourseLoading());
    final result = await unassignStudentFromCourse(
      UnassignStudentFromCourseParams(
        studentId: event.studentId,
        courseId: event.courseId,
      ),
    );
    result.match(
      (failure) {
        debugPrint('UnassignStudentFromCourse Error: ${failure.message}');
        emit(StudentCourseError(failure.message));
      },
      (success) {
        debugPrint('UnassignStudentFromCourse Success');
        emit(const StudentCourseUnassigned('Student unassigned successfully'));
        // Reload students after successful unassignment
        add(LoadStudentsByCourse(event.courseId));
      },
    );
  }
}

