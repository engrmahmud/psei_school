import 'package:get_it/get_it.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/features/students/data/student_repository_impl.dart';
import 'package:psei_school_flutter/features/students/domain/repositories/student_repository.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/get_all_students.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/get_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/create_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/update_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/delete_student.dart';
import 'package:psei_school_flutter/features/students/domain/usecases/search_students.dart';
import 'package:psei_school_flutter/features/students/presentation/bloc/student_bloc.dart';
import 'package:psei_school_flutter/features/teachers/data/teacher_repository_impl.dart';
import 'package:psei_school_flutter/features/teachers/domain/repositories/teacher_repository.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/get_all_teachers.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/get_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/create_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/update_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/delete_teacher.dart';
import 'package:psei_school_flutter/features/teachers/domain/usecases/search_teachers.dart';
import 'package:psei_school_flutter/features/teachers/presentation/bloc/teacher_bloc.dart';
import 'package:psei_school_flutter/features/courses/data/course_repository_impl.dart';
import 'package:psei_school_flutter/features/courses/data/student_course_repository_impl.dart';
import 'package:psei_school_flutter/features/courses/data/teacher_course_repository_impl.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/course_repository.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/student_course_repository.dart';
import 'package:psei_school_flutter/features/courses/domain/repositories/teacher_course_repository.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_all_courses.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/create_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/update_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/delete_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/search_courses.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/assign_student_to_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/assign_teacher_to_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_students_by_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/get_teachers_by_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/unassign_student_from_course.dart';
import 'package:psei_school_flutter/features/courses/domain/usecases/unassign_teacher_from_course.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/student_course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/teacher_course_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies(Client client) async {
  // Register the Client instance
  sl.registerLazySingleton<Client>(() => client);

  // Student Feature
  sl.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(sl<Client>()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllStudentsUseCase(sl()));
  sl.registerLazySingleton(() => GetStudentUseCase(sl()));
  sl.registerLazySingleton(() => CreateStudentUseCase(sl()));
  sl.registerLazySingleton(() => UpdateStudentUseCase(sl()));
  sl.registerLazySingleton(() => DeleteStudentUseCase(sl()));
  sl.registerLazySingleton(() => SearchStudentsUseCase(sl()));

  // Bloc
  sl.registerFactory(() => StudentBloc(
        getAllStudents: sl(),
        getStudent: sl(),
        createStudent: sl(),
        updateStudent: sl(),
        deleteStudent: sl(),
        searchStudents: sl(),
      ));

  // Teacher Feature
  sl.registerLazySingleton<TeacherRepository>(
    () => TeacherRepositoryImpl(sl<Client>()),
  );

  // Teacher UseCases
  sl.registerLazySingleton(() => GetAllTeachersUseCase(sl()));
  sl.registerLazySingleton(() => GetTeacherUseCase(sl()));
  sl.registerLazySingleton(() => CreateTeacherUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTeacherUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTeacherUseCase(sl()));
  sl.registerLazySingleton(() => SearchTeachersUseCase(sl()));

  // Teacher Bloc
  sl.registerFactory(() => TeacherBloc(
        getAllTeachers: sl(),
        getTeacher: sl(),
        createTeacher: sl(),
        updateTeacher: sl(),
        deleteTeacher: sl(),
        searchTeachers: sl(),
      ));

  // Course Feature
  sl.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(sl<Client>()),
  );

  // Course UseCases
  sl.registerLazySingleton(() => GetAllCoursesUseCase(sl()));
  sl.registerLazySingleton(() => GetCourseUseCase(sl()));
  sl.registerLazySingleton(() => CreateCourseUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCourseUseCase(sl()));
  sl.registerLazySingleton(() => DeleteCourseUseCase(sl()));
  sl.registerLazySingleton(() => SearchCoursesUseCase(sl()));

// Course Bloc
  sl.registerFactory(() => CourseBloc(
        getAllCourses: sl(),
        getCourse: sl(),
        createCourse: sl(),
        updateCourse: sl(),
        deleteCourse: sl(),
        searchCourses: sl(),
      ));

  // StudentCourse Feature
  sl.registerLazySingleton<StudentCourseRepository>(
    () => StudentCourseRepositoryImpl(sl<Client>()),
  );

  // StudentCourse UseCases
  sl.registerLazySingleton(() => AssignStudentToCourseUseCase(sl()));
  sl.registerLazySingleton(() => GetStudentsByCourseUseCase(sl()));
  sl.registerLazySingleton(() => UnassignStudentFromCourseUseCase(sl()));

  // StudentCourse Bloc
  sl.registerFactory(() => StudentCourseBloc(
        getStudentsByCourse: sl(),
        assignStudentToCourse: sl(),
        unassignStudentFromCourse: sl(),
      ));

  // TeacherCourse Feature
  sl.registerLazySingleton<TeacherCourseRepository>(
    () => TeacherCourseRepositoryImpl(sl<Client>()),
  );

  // TeacherCourse UseCases
  sl.registerLazySingleton(() => AssignTeacherToCourseUseCase(sl()));
  sl.registerLazySingleton(() => GetTeachersByCourseUseCase(sl()));
  sl.registerLazySingleton(() => UnassignTeacherFromCourseUseCase(sl()));

  // TeacherCourse Bloc
  sl.registerFactory(() => TeacherCourseBloc(
        getTeachersByCourse: sl(),
        assignTeacherToCourse: sl(),
        unassignTeacherFromCourse: sl(),
      ));
}
