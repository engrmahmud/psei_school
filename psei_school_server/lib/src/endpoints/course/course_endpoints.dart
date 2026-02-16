import 'package:serverpod/serverpod.dart';
import 'package:psei_school_server/src/generated/protocol.dart';

class CourseEndpoints extends Endpoint {
  // Create course
  Future<Course> createCourse(Session session, Course course) async {
    return await Course.db.insertRow(session, course);
  }

  // Get all courses
  Future<List<Course>> getCourses(Session session) async {
    return await Course.db.find(session);
  }

  // Get course by id
  Future<Course?> getCourseById(Session session, int id) async {
    return await Course.db.findById(session, id);
  }

  // Update course by id
  Future<Course?> updateCourseById(Session session, int id, Course course) async {
    course.id = id;
    return await Course.db.updateRow(session, course);
  }

  // Delete course by id
  Future<bool> deleteCourseById(Session session, int id) async {
    final course = await Course.db.findById(session, id);
    if (course == null) {
      return false;
    }
    await Course.db.deleteRow(session, course);
    return true;
  }

  // Search courses
  Future<List<Course>> searchCourses(
    Session session, {
    String? courseName,
    String? subjectCode,
    int? classLevel,
    int? teacherId,
  }) async {
    return await Course.db.find(
      session,
      where: (c) {
        Expression exp = Constant.bool(true);
        if (courseName != null && courseName.isNotEmpty) {
          exp = exp & c.courseName.ilike('%$courseName%');
        }
        if (subjectCode != null && subjectCode.isNotEmpty) {
          exp = exp & c.subjectCode.ilike('%$subjectCode%');
        }
        if (classLevel != null) {
          exp = exp & c.classLevel.equals(classLevel);
        }
        if (teacherId != null) {
          exp = exp & c.teacherId.equals(teacherId);
        }
        return exp;
      },
    );
  }
}

