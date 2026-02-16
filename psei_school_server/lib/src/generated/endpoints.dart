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
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/admin/admin_endpoints.dart' as _i4;
import '../endpoints/course/course_endpoints.dart' as _i5;
import '../endpoints/student/student_endpoints.dart' as _i6;
import '../endpoints/teacher/teacher_endpoints.dart' as _i7;
import '../endpoints/student_course/student_course_endpoints.dart' as _i13;
import '../endpoints/teacher_course/teacher_course_endpoints.dart' as _i14;
import 'package:psei_school_server/src/generated/course_model.dart' as _i8;
import 'package:psei_school_server/src/generated/student_model.dart' as _i9;
import 'package:psei_school_server/src/generated/teacher_model.dart' as _i10;
import 'package:psei_school_server/src/generated/student_course_model.dart' as _i15;
import 'package:psei_school_server/src/generated/teacher_course_model.dart' as _i16;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i11;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'auth': _i4.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'courseEndpoints': _i5.CourseEndpoints()
        ..initialize(
          server,
          'courseEndpoints',
          null,
        ),
      'studentEndpoints': _i6.StudentEndpoints()
        ..initialize(
          server,
          'studentEndpoints',
          null,
        ),
      'teacherEndpoints': _i7.TeacherEndpoints()
        ..initialize(
          server,
          'teacherEndpoints',
          null,
        ),
      'studentCourseEndpoints': _i13.StudentCourseEndpoints()
        ..initialize(
          server,
          'studentCourseEndpoints',
          null,
        ),
      'teacherCourseEndpoints': _i14.TeacherCourseEndpoints()
        ..initialize(
          server,
          'teacherCourseEndpoints',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'verifyAdmin': _i1.MethodConnector(
          name: 'verifyAdmin',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i4.AuthEndpoint).verifyAdmin(
                session,
                params['email'],
                params['password'],
              ),
        ),
      },
    );
    connectors['courseEndpoints'] = _i1.EndpointConnector(
      name: 'courseEndpoints',
      endpoint: endpoints['courseEndpoints']!,
      methodConnectors: {
        'createCourse': _i1.MethodConnector(
          name: 'createCourse',
          params: {
            'course': _i1.ParameterDescription(
              name: 'course',
              type: _i1.getType<_i8.Course>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseEndpoints'] as _i5.CourseEndpoints)
                  .createCourse(
                    session,
                    params['course'],
                  ),
        ),
        'getCourses': _i1.MethodConnector(
          name: 'getCourses',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseEndpoints'] as _i5.CourseEndpoints)
                  .getCourses(session),
        ),
        'getCourseById': _i1.MethodConnector(
          name: 'getCourseById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseEndpoints'] as _i5.CourseEndpoints)
                  .getCourseById(
                    session,
                    params['id'],
                  ),
        ),
        'updateCourseById': _i1.MethodConnector(
          name: 'updateCourseById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'course': _i1.ParameterDescription(
              name: 'course',
              type: _i1.getType<_i8.Course>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseEndpoints'] as _i5.CourseEndpoints)
                  .updateCourseById(
                    session,
                    params['id'],
                    params['course'],
                  ),
        ),
        'deleteCourseById': _i1.MethodConnector(
          name: 'deleteCourseById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseEndpoints'] as _i5.CourseEndpoints)
                  .deleteCourseById(
                    session,
                    params['id'],
                  ),
        ),
        'searchCourses': _i1.MethodConnector(
          name: 'searchCourses',
          params: {
            'courseName': _i1.ParameterDescription(
              name: 'courseName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'subjectCode': _i1.ParameterDescription(
              name: 'subjectCode',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'classLevel': _i1.ParameterDescription(
              name: 'classLevel',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseEndpoints'] as _i5.CourseEndpoints)
                  .searchCourses(
                    session,
                    courseName: params['courseName'],
                    subjectCode: params['subjectCode'],
                    classLevel: params['classLevel'],
                    teacherId: params['teacherId'],
                  ),
        ),
      },
    );
    connectors['studentEndpoints'] = _i1.EndpointConnector(
      name: 'studentEndpoints',
      endpoint: endpoints['studentEndpoints']!,
      methodConnectors: {
        'createStudent': _i1.MethodConnector(
          name: 'createStudent',
          params: {
            'student': _i1.ParameterDescription(
              name: 'student',
              type: _i1.getType<_i9.Student>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentEndpoints'] as _i6.StudentEndpoints)
                  .createStudent(
                    session,
                    params['student'],
                  ),
        ),
        'getStudents': _i1.MethodConnector(
          name: 'getStudents',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentEndpoints'] as _i6.StudentEndpoints)
                  .getStudents(session),
        ),
        'getStudentById': _i1.MethodConnector(
          name: 'getStudentById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentEndpoints'] as _i6.StudentEndpoints)
                  .getStudentById(
                    session,
                    params['id'],
                  ),
        ),
        'updateStudentById': _i1.MethodConnector(
          name: 'updateStudentById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'student': _i1.ParameterDescription(
              name: 'student',
              type: _i1.getType<_i9.Student>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentEndpoints'] as _i6.StudentEndpoints)
                  .updateStudentById(
                    session,
                    params['id'],
                    params['student'],
                  ),
        ),
        'deleteStudentById': _i1.MethodConnector(
          name: 'deleteStudentById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentEndpoints'] as _i6.StudentEndpoints)
                  .deleteStudentById(
                    session,
                    params['id'],
                  ),
        ),
        'searchStudents': _i1.MethodConnector(
          name: 'searchStudents',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'roll': _i1.ParameterDescription(
              name: 'roll',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'registration': _i1.ParameterDescription(
              name: 'registration',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'studentClass': _i1.ParameterDescription(
              name: 'studentClass',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentEndpoints'] as _i6.StudentEndpoints)
                  .searchStudents(
                    session,
                    name: params['name'],
                    id: params['id'],
                    roll: params['roll'],
                    registration: params['registration'],
                    studentClass: params['studentClass'],
                  ),
        ),
      },
    );
    connectors['teacherEndpoints'] = _i1.EndpointConnector(
      name: 'teacherEndpoints',
      endpoint: endpoints['teacherEndpoints']!,
      methodConnectors: {
        'createTeacher': _i1.MethodConnector(
          name: 'createTeacher',
          params: {
            'teacher': _i1.ParameterDescription(
              name: 'teacher',
              type: _i1.getType<_i10.Teacher>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherEndpoints'] as _i7.TeacherEndpoints)
                  .createTeacher(
                    session,
                    params['teacher'],
                  ),
        ),
        'getTeachers': _i1.MethodConnector(
          name: 'getTeachers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherEndpoints'] as _i7.TeacherEndpoints)
                  .getTeachers(session),
        ),
        'getTeacherById': _i1.MethodConnector(
          name: 'getTeacherById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherEndpoints'] as _i7.TeacherEndpoints)
                  .getTeacherById(
                    session,
                    params['id'],
                  ),
        ),
        'updateTeacherById': _i1.MethodConnector(
          name: 'updateTeacherById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'teacher': _i1.ParameterDescription(
              name: 'teacher',
              type: _i1.getType<_i10.Teacher>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherEndpoints'] as _i7.TeacherEndpoints)
                  .updateTeacherById(
                    session,
                    params['id'],
                    params['teacher'],
                  ),
        ),
        'deleteTeacherById': _i1.MethodConnector(
          name: 'deleteTeacherById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherEndpoints'] as _i7.TeacherEndpoints)
                  .deleteTeacherById(
                    session,
                    params['id'],
                  ),
        ),
        'searchTeachers': _i1.MethodConnector(
          name: 'searchTeachers',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'department': _i1.ParameterDescription(
              name: 'department',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'designation': _i1.ParameterDescription(
              name: 'designation',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherEndpoints'] as _i7.TeacherEndpoints)
                  .searchTeachers(
                    session,
                    name: params['name'],
                    id: params['id'],
                    department: params['department'],
                    designation: params['designation'],
                  ),
        ),
      },
    );
    connectors['studentCourseEndpoints'] = _i1.EndpointConnector(
      name: 'studentCourseEndpoints',
      endpoint: endpoints['studentCourseEndpoints']!,
      methodConnectors: {
        'assignStudentToCourse': _i1.MethodConnector(
          name: 'assignStudentToCourse',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .assignStudentToCourse(
                    session,
                    studentId: params['studentId'],
                    courseId: params['courseId'],
                  ),
        ),
        'getStudentCoursesByCourse': _i1.MethodConnector(
          name: 'getStudentCoursesByCourse',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .getStudentCoursesByCourse(
                    session,
                    params['courseId'],
                  ),
        ),
        'getStudentCoursesByStudent': _i1.MethodConnector(
          name: 'getStudentCoursesByStudent',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .getStudentCoursesByStudent(
                    session,
                    params['studentId'],
                  ),
        ),
        'updateStudentCourseMarks': _i1.MethodConnector(
          name: 'updateStudentCourseMarks',
          params: {
            'studentCourseId': _i1.ParameterDescription(
              name: 'studentCourseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'marks': _i1.ParameterDescription(
              name: 'marks',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .updateStudentCourseMarks(
                    session,
                    studentCourseId: params['studentCourseId'],
                    marks: params['marks'],
                  ),
        ),
        'unassignStudentFromCourse': _i1.MethodConnector(
          name: 'unassignStudentFromCourse',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .unassignStudentFromCourse(
                    session,
                    studentId: params['studentId'],
                    courseId: params['courseId'],
                  ),
        ),
        'deleteStudentCourseById': _i1.MethodConnector(
          name: 'deleteStudentCourseById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .deleteStudentCourseById(
                    session,
                    params['id'],
                  ),
        ),
        'getStudentsByCourse': _i1.MethodConnector(
          name: 'getStudentsByCourse',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .getStudentsByCourse(
                    session,
                    params['courseId'],
                  ),
        ),
        'getCoursesByStudent': _i1.MethodConnector(
          name: 'getCoursesByStudent',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .getCoursesByStudent(
                    session,
                    params['studentId'],
                  ),
        ),
        'isStudentEnrolled': _i1.MethodConnector(
          name: 'isStudentEnrolled',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .isStudentEnrolled(
                    session,
                    studentId: params['studentId'],
                    courseId: params['courseId'],
                  ),
        ),
        'bulkAssignStudentsToCourse': _i1.MethodConnector(
          name: 'bulkAssignStudentsToCourse',
          params: {
            'studentIds': _i1.ParameterDescription(
              name: 'studentIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['studentCourseEndpoints'] as _i13.StudentCourseEndpoints)
                  .bulkAssignStudentsToCourse(
                    session,
                    studentIds: params['studentIds'],
                    courseId: params['courseId'],
                  ),
        ),
      },
    );
    connectors['teacherCourseEndpoints'] = _i1.EndpointConnector(
      name: 'teacherCourseEndpoints',
      endpoint: endpoints['teacherCourseEndpoints']!,
      methodConnectors: {
        'assignTeacherToCourse': _i1.MethodConnector(
          name: 'assignTeacherToCourse',
          params: {
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .assignTeacherToCourse(
                    session,
                    teacherId: params['teacherId'],
                    courseId: params['courseId'],
                    role: params['role'],
                  ),
        ),
        'getTeacherCoursesByCourse': _i1.MethodConnector(
          name: 'getTeacherCoursesByCourse',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .getTeacherCoursesByCourse(
                    session,
                    params['courseId'],
                  ),
        ),
        'getTeacherCoursesByTeacher': _i1.MethodConnector(
          name: 'getTeacherCoursesByTeacher',
          params: {
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .getTeacherCoursesByTeacher(
                    session,
                    params['teacherId'],
                  ),
        ),
        'updateTeacherCourseRole': _i1.MethodConnector(
          name: 'updateTeacherCourseRole',
          params: {
            'teacherCourseId': _i1.ParameterDescription(
              name: 'teacherCourseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .updateTeacherCourseRole(
                    session,
                    teacherCourseId: params['teacherCourseId'],
                    role: params['role'],
                  ),
        ),
        'unassignTeacherFromCourse': _i1.MethodConnector(
          name: 'unassignTeacherFromCourse',
          params: {
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .unassignTeacherFromCourse(
                    session,
                    teacherId: params['teacherId'],
                    courseId: params['courseId'],
                  ),
        ),
        'deleteTeacherCourseById': _i1.MethodConnector(
          name: 'deleteTeacherCourseById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .deleteTeacherCourseById(
                    session,
                    params['id'],
                  ),
        ),
        'getTeachersByCourse': _i1.MethodConnector(
          name: 'getTeachersByCourse',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .getTeachersByCourse(
                    session,
                    params['courseId'],
                  ),
        ),
        'getCoursesByTeacher': _i1.MethodConnector(
          name: 'getCoursesByTeacher',
          params: {
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .getCoursesByTeacher(
                    session,
                    params['teacherId'],
                  ),
        ),
        'isTeacherAssigned': _i1.MethodConnector(
          name: 'isTeacherAssigned',
          params: {
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .isTeacherAssigned(
                    session,
                    teacherId: params['teacherId'],
                    courseId: params['courseId'],
                  ),
        ),
        'getTeacherCourseByTeacherAndCourse': _i1.MethodConnector(
          name: 'getTeacherCourseByTeacherAndCourse',
          params: {
            'teacherId': _i1.ParameterDescription(
              name: 'teacherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['teacherCourseEndpoints'] as _i14.TeacherCourseEndpoints)
                  .getTeacherCourseByTeacherAndCourse(
                    session,
                    teacherId: params['teacherId'],
                    courseId: params['courseId'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i11.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i12.Endpoints()
      ..initializeEndpoints(server);
  }
}
