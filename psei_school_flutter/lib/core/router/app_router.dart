import 'package:go_router/go_router.dart';
import 'package:psei_school_flutter/features/dashboards/admin_dashboard.dart';
import 'package:psei_school_flutter/features/students/presentation/pages/student_admission_page.dart';
import 'package:psei_school_flutter/features/students/presentation/pages/student_list_page.dart';
import 'package:psei_school_flutter/features/students/presentation/pages/student_edit_page.dart';
import 'package:psei_school_flutter/features/students/presentation/pages/student_detail_page.dart';
import 'package:psei_school_flutter/features/teachers/presentation/pages/teacher_admission_page.dart';
import 'package:psei_school_flutter/features/teachers/presentation/pages/teacher_list_page.dart';
import 'package:psei_school_flutter/features/teachers/presentation/pages/teacher_edit_page.dart';
import 'package:psei_school_flutter/features/teachers/presentation/pages/teacher_detail_page.dart';
import 'package:psei_school_flutter/features/courses/presentation/pages/course_list_page.dart';
import 'package:psei_school_flutter/features/courses/presentation/pages/course_admission_page.dart';
import 'package:psei_school_flutter/features/courses/presentation/pages/course_detail_page.dart';
import 'package:psei_school_flutter/features/courses/presentation/pages/course_edit_page.dart';
import 'package:psei_school_flutter/main.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    // Admin login
    GoRoute(
      path: '/',
      builder: (_, __) => const AdminDashboardPage(),
    ),

    // Student admission
    GoRoute(
      path: '/student-admission',
      builder: (_, __) => StudentAdmissionPage(client: client,),
    ),

    // Student list
    GoRoute(
      path: '/student-list',
      builder: (_, __) => StudentListPage(client: client,),
    ),

    // Student edit
    GoRoute(
      path: '/students/:id/edit',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return StudentEditPage(studentId: id);
      },
    ),

    // Student detail
    GoRoute(
      path: '/students/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return StudentDetailPage(studentId: id);
      },
    ),

    // Teacher recruitment
    GoRoute(
      path: '/teacher-recruitment',
      builder: (_, __) => TeacherAdmissionPage(client: client,),
    ),

    // Teacher list
    GoRoute(
      path: '/teacher-list',
      builder: (_, __) => TeacherListPage(client: client,),
    ),

    // Teacher edit
    GoRoute(
      path: '/teachers/:id/edit',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return TeacherEditPage(teacherId: id);
      },
    ),

    // Teacher detail
    GoRoute(
      path: '/teachers/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return TeacherDetailPage(teacherId: id);
      },
    ),

    // Course list
    GoRoute(
      path: '/course-list',
      builder: (_, __) => CourseListPage(),
    ),

    // Course admission
    GoRoute(
      path: '/course-admission',
      builder: (_, __) => CourseAdmissionPage(client: client),
    ),

    // Course detail
    GoRoute(
      path: '/courses/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        // For now, navigate to list and let them use the built-in navigation
        // A proper implementation would fetch the course by ID
        return const CourseListPage();
      },
    ),

    // Course edit
    GoRoute(
      path: '/courses/:id/edit',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        // For now, navigate to list and let them use the built-in navigation
        // A proper implementation would fetch the course by ID
        return const CourseListPage();
      },
    ),
  ],
);
