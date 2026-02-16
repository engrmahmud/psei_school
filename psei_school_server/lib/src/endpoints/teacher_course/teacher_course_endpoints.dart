import 'package:serverpod/serverpod.dart';
import 'package:psei_school_server/src/generated/protocol.dart';

class TeacherCourseEndpoints extends Endpoint {
  // Assign a teacher to a course
  Future<TeacherCourse> assignTeacherToCourse(
    Session session, {
    required int teacherId,
    required int courseId,
    String? role,
  }) async {
    // Check if assignment already exists
    final existing = await TeacherCourse.db.find(
      session,
      where: (t) => t.teacherId.equals(teacherId) & t.courseId.equals(courseId),
    );
    
    if (existing.isNotEmpty) {
      throw Exception('Teacher is already assigned to this course');
    }
    
    final teacherCourse = TeacherCourse(
      teacherId: teacherId,
      courseId: courseId,
      assignedDate: DateTime.now(),
      role: role,
    );
    
    return await TeacherCourse.db.insertRow(session, teacherCourse);
  }

  // Get all teacher courses by course
  Future<List<TeacherCourse>> getTeacherCoursesByCourse(
    Session session,
    int courseId,
  ) async {
    return await TeacherCourse.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
    );
  }

  // Get all courses by teacher
  Future<List<TeacherCourse>> getTeacherCoursesByTeacher(
    Session session,
    int teacherId,
  ) async {
    return await TeacherCourse.db.find(
      session,
      where: (t) => t.teacherId.equals(teacherId),
    );
  }

  // Update teacher course role
  Future<TeacherCourse?> updateTeacherCourseRole(
    Session session, {
    required int teacherCourseId,
    String? role,
  }) async {
    final teacherCourse = await TeacherCourse.db.findById(session, teacherCourseId);
    if (teacherCourse == null) return null;
    
    teacherCourse.role = role;
    return await TeacherCourse.db.updateRow(session, teacherCourse);
  }

  // Unassign a teacher from a course
  Future<bool> unassignTeacherFromCourse(
    Session session, {
    required int teacherId,
    required int courseId,
  }) async {
    final result = await TeacherCourse.db.deleteWhere(
      session,
      where: (t) => t.teacherId.equals(teacherId) & t.courseId.equals(courseId),
    );
    return result.isNotEmpty;
  }

  // Delete teacher course by ID
  Future<bool> deleteTeacherCourseById(Session session, int id) async {
    final teacherCourse = await TeacherCourse.db.findById(session, id);
    if (teacherCourse == null) return false;
    
    await TeacherCourse.db.deleteRow(session, teacherCourse);
    return true;
  }

  // Get teachers by course with teacher details
  Future<List<Teacher>> getTeachersByCourse(Session session, int courseId) async {
    final teacherCourses = await TeacherCourse.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
    );
    
    final teachers = <Teacher>[];
    for (final tc in teacherCourses) {
      final teacher = await Teacher.db.findById(session, tc.teacherId);
      if (teacher != null) {
        teachers.add(teacher);
      }
    }
    return teachers;
  }

  // Get courses by teacher with course details
  Future<List<Course>> getCoursesByTeacher(Session session, int teacherId) async {
    final teacherCourses = await TeacherCourse.db.find(
      session,
      where: (t) => t.teacherId.equals(teacherId),
    );
    
    final courses = <Course>[];
    for (final tc in teacherCourses) {
      final course = await Course.db.findById(session, tc.courseId);
      if (course != null) {
        courses.add(course);
      }
    }
    return courses;
  }

  // Check if teacher is assigned to course
  Future<bool> isTeacherAssigned(
    Session session, {
    required int teacherId,
    required int courseId,
  }) async {
    final result = await TeacherCourse.db.find(
      session,
      where: (t) => t.teacherId.equals(teacherId) & t.courseId.equals(courseId),
    );
    return result.isNotEmpty;
  }

  // Get teacher course with role by course
  Future<TeacherCourse?> getTeacherCourseByTeacherAndCourse(
    Session session, {
    required int teacherId,
    required int courseId,
  }) async {
    final result = await TeacherCourse.db.find(
      session,
      where: (t) => t.teacherId.equals(teacherId) & t.courseId.equals(courseId),
    );
    return result.isNotEmpty ? result.first : null;
  }
}

