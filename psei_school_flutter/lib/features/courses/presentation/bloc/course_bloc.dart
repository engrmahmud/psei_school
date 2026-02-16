import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_flutter/core/usecase/usecase.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/create_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/delete_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_all_courses.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/search_courses.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/update_course.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetAllCoursesUseCase getAllCourses;
  final GetCourseUseCase getCourse;
  final CreateCourseUseCase createCourse;
  final UpdateCourseUseCase updateCourse;
  final DeleteCourseUseCase deleteCourse;
  final SearchCoursesUseCase searchCourses;

  CourseBloc({
    required this.getAllCourses,
    required this.getCourse,
    required this.createCourse,
    required this.updateCourse,
    required this.deleteCourse,
    required this.searchCourses,
  }) : super(CourseInitial()) {
    on<LoadCourses>(_onLoadCourses);
    on<GetCourseById>(_onGetCourseById);
    on<CreateCourse>(_onCreateCourse);
    on<UpdateCourse>(_onUpdateCourse);
    on<DeleteCourse>(_onDeleteCourse);
    on<SearchCourses>(_onSearchCourses);
  }

  Future<void> _onLoadCourses(
      LoadCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final result = await getAllCourses(NoParams());
    result.match(
      (failure) {
        debugPrint('LoadCourses Error: ${failure.message}');
        emit(CourseError(failure.message));
      },
      (courses) {
        debugPrint('LoadCourses Success: ${courses.length} courses found');
        emit(CourseLoaded(courses));
      },
    );
  }

  Future<void> _onGetCourseById(
      GetCourseById event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final result = await getCourse(GetCourseParams(event.id));
    result.match(
      (failure) => emit(CourseError(failure.message)),
      (course) => emit(CourseLoaded([course])),
    );
  }

  Future<void> _onCreateCourse(
      CreateCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final result = await createCourse(CreateCourseParams(event.course));
    result.match(
      (failure) => emit(CourseError(failure.message)),
      (_) => emit(CourseSuccess('Course created successfully')),
    );
  }

  Future<void> _onUpdateCourse(
      UpdateCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final result =
        await updateCourse(UpdateCourseParams(event.id, event.course));
    result.match(
      (failure) => emit(CourseError(failure.message)),
      (_) => emit(CourseSuccess('Course updated successfully')),
    );
  }

  Future<void> _onDeleteCourse(
      DeleteCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final result = await deleteCourse(DeleteCourseParams(event.id));
    await result.match(
      (failure) async => emit(CourseError(failure.message)),
      (_) async {
        // Reload courses after successful deletion
        final coursesResult = await getAllCourses(NoParams());
        coursesResult.match(
          (failure) => emit(CourseError(failure.message)),
          (courses) => emit(CourseLoaded(courses)),
        );
      },
    );
  }

  Future<void> _onSearchCourses(
      SearchCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final result = await searchCourses(SearchCourseParams(
      courseName: event.courseName,
      subjectCode: event.subjectCode,
      classLevel: event.classLevel,
      teacherId: event.teacherId,
    ));
    result.match(
      (failure) {
        debugPrint('SearchCourses Error: ${failure.message}');
        emit(CourseError(failure.message));
      },
      (courses) {
        debugPrint('SearchCourses Success: ${courses.length} courses found');
        emit(CourseLoaded(courses));
      },
    );
  }
}

