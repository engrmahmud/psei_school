import 'package:serverpod/serverpod.dart';
import 'package:psei_school_server/src/generated/protocol.dart';

class StudentCourseEndpoints extends Endpoint {
  // Assign a student to a course
  Future<StudentCourse> assignStudentToCourse(
    Session session, {
    required int studentId,
    required int courseId,
  }) async {
    // Check if assignment already exists
    final existing = await StudentCourse.db.find(
      session,
      where: (t) => t.studentId.equals(studentId) & t.courseId.equals(courseId),
    );
    
    if (existing.isNotEmpty) {
      throw Exception('Student is already assigned to this course');
    }
    
    final studentCourse = StudentCourse(
      studentId: studentId,
      courseId: courseId,
      enrollmentDate: DateTime.now(),
    );
    
    return await StudentCourse.db.insertRow(session, studentCourse);
  }

  // Get all students by course
  Future<List<StudentCourse>> getStudentCoursesByCourse(
    Session session,
    int courseId,
  ) async {
    return await StudentCourse.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
    );
  }

  // Get all courses by student
  Future<List<StudentCourse>> getStudentCoursesByStudent(
    Session session,
    int studentId,
  ) async {
    return await StudentCourse.db.find(
      session,
      where: (t) => t.studentId.equals(studentId),
    );
  }

  // Update student course marks
  Future<StudentCourse?> updateStudentCourseMarks(
    Session session, {
    required int studentCourseId,
    double? marks,
  }) async {
    final studentCourse = await StudentCourse.db.findById(session, studentCourseId);
    if (studentCourse == null) return null;
    
    studentCourse.marks = marks;
    return await StudentCourse.db.updateRow(session, studentCourse);
  }

  // Unassign a student from a course
  Future<bool> unassignStudentFromCourse(
    Session session, {
    required int studentId,
    required int courseId,
  }) async {
    final result = await StudentCourse.db.deleteWhere(
      session,
      where: (t) => t.studentId.equals(studentId) & t.courseId.equals(courseId),
    );
    return result.isNotEmpty;
  }

  // Delete student course by ID
  Future<bool> deleteStudentCourseById(Session session, int id) async {
    final studentCourse = await StudentCourse.db.findById(session, id);
    if (studentCourse == null) return false;
    
    await StudentCourse.db.deleteRow(session, studentCourse);
    return true;
  }

  // Get students by course with student details
  Future<List<Student>> getStudentsByCourse(Session session, int courseId) async {
    final studentCourses = await StudentCourse.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
    );
    
    final students = <Student>[];
    for (final sc in studentCourses) {
      final student = await Student.db.findById(session, sc.studentId);
      if (student != null) {
        students.add(student);
      }
    }
    return students;
  }

  // Get courses by student with course details
  Future<List<Course>> getCoursesByStudent(Session session, int studentId) async {
    final studentCourses = await StudentCourse.db.find(
      session,
      where: (t) => t.studentId.equals(studentId),
    );
    
    final courses = <Course>[];
    for (final sc in studentCourses) {
      final course = await Course.db.findById(session, sc.courseId);
      if (course != null) {
        courses.add(course);
      }
    }
    return courses;
  }

  // Check if student is enrolled in course
  Future<bool> isStudentEnrolled(
    Session session, {
    required int studentId,
    required int courseId,
  }) async {
    final result = await StudentCourse.db.find(
      session,
      where: (t) => t.studentId.equals(studentId) & t.courseId.equals(courseId),
    );
    return result.isNotEmpty;
  }

  // Bulk assign students to a course
  Future<List<StudentCourse>> bulkAssignStudentsToCourse(
    Session session, {
    required List<int> studentIds,
    required int courseId,
  }) async {
    final studentCourses = <StudentCourse>[];
    
    for (final studentId in studentIds) {
      // Check if assignment already exists
      final existing = await StudentCourse.db.find(
        session,
        where: (t) => t.studentId.equals(studentId) & t.courseId.equals(courseId),
      );
      
      if (existing.isEmpty) {
        final studentCourse = StudentCourse(
          studentId: studentId,
          courseId: courseId,
          enrollmentDate: DateTime.now(),
        );
        studentCourses.add(studentCourse);
      }
    }
    
    if (studentCourses.isNotEmpty) {
      return await StudentCourse.db.insert(session, studentCourses);
    }
    return [];
  }
}

