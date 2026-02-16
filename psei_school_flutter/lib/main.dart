import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/dependencies/injection.dart';
import 'package:psei_school_flutter/core/router/app_router.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/student_course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/teacher_course_bloc.dart';
import 'package:psei_school_flutter/features/students/presentation/bloc/student_bloc.dart';
import 'package:psei_school_flutter/features/students/presentation/bloc/student_event.dart';
import 'package:psei_school_flutter/features/teachers/presentation/bloc/teacher_bloc.dart';
import 'package:psei_school_flutter/features/teachers/presentation/bloc/teacher_event.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_event.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late Client client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  // Initialize GetIt with all dependencies
  await initDependencies(client);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentBloc>(
          create: (_) => sl<StudentBloc>()..add(LoadStudents()),
        ),
        BlocProvider<TeacherBloc>(
          create: (_) => sl<TeacherBloc>()..add(LoadTeachers()),
        ),
        BlocProvider<CourseBloc>(
          create: (_) => sl<CourseBloc>()..add(LoadCourses()),
        ),
        BlocProvider<StudentCourseBloc>(
          create: (_) => sl<StudentCourseBloc>(),
        ),
        BlocProvider<TeacherCourseBloc>(
          create: (_) => sl<TeacherCourseBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter, 
      ),
    );
  }
}
