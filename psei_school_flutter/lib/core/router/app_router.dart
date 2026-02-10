import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/student_services.dart';
import 'package:psei_school_flutter/core/services/teacher_services.dart';
import 'package:psei_school_flutter/features/auth/admin/login/login_page.dart';
import 'package:psei_school_flutter/features/dashboards/admin_dashboard.dart';
import 'package:psei_school_flutter/features/dashboards/students/student_admission.dart';
import 'package:psei_school_flutter/features/dashboards/students/student_edit_page.dart';
import 'package:psei_school_flutter/features/dashboards/students/students_detail_page.dart';
import 'package:psei_school_flutter/features/dashboards/students/students_list_page.dart';
import 'package:psei_school_flutter/features/dashboards/teachers/teacher_details_page.dart';
import 'package:psei_school_flutter/features/dashboards/teachers/teacher_edit_page.dart';
import 'package:psei_school_flutter/features/dashboards/teachers/teacher_list_page.dart';
import 'package:psei_school_flutter/features/dashboards/teachers/teacher_recruitment_page.dart';





GoRouter appRouter(Client client) => GoRouter(
  routes: [
    // GoRoute(
      // path: '/',
      // builder: (_, __) => AdminLoginScreen(client: client),
    // ),
    // GoRoute(
      // path: '/admin-dashboard',
      // builder: (_, __) => AdminDashboardPage(),
    // ),
    GoRoute(
       path: '/',
       builder: (_, __) => AdminDashboardPage(),
    ),
    GoRoute(
      path: '/student-admission',
      builder: (_, __) => StudentAdmissionPage(client: client,),
    ),

    //student list
    GoRoute(
      path: '/student-list', 
      builder: (_, __) => StudentsListPage(service: StudentServices(client)),
    ),

    //student edit
    GoRoute(
      path: '/students/:id/edit',
      builder: (context, state) {
       final id = int.parse(state.pathParameters['id']!);
       return StudentEditPage(service: StudentServices(client), studentId: id);
     },
    ),
    //student detail
    GoRoute(
      path: '/students/:id',
      builder: (context, state) {
       final id = int.parse(state.pathParameters['id']!);
        return StudentDetailPage(service: StudentServices(client), studentId: id);
      },
    ),

    //teacher recruitment
    GoRoute(
     path: '/teacher-recruitment',
     builder: (_, __) => TeacherRecruitmentPage(client: client,),
    ),

    //teacher list
     GoRoute(
       path: '/teacher-list', 
       builder: (_, __) => TeacherListPage(service: TeacherServices(client)),
     ),

     //teacher edit
      GoRoute(
       path: '/teachers/:id/edit',
       builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return TeacherEditPage(service: TeacherServices(client), teacherId: id);
      },
    ),
    //teacher detail
    GoRoute(
      path: '/teachers/:id',
      builder: (context, state) {
       final id = int.parse(state.pathParameters['id']!);
        return TeacherDetailsPage(service: TeacherServices(client), teacherId: id);
      },
    ),

    
       
    
],

);

















