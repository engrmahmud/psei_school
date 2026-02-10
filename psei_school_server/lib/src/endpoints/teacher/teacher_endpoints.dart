import 'package:psei_school_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TeacherEndpoints extends Endpoint{

  //Create teacher by recruitment
  Future<Teacher> createTeacher(Session session, Teacher teacher) async {
    return await Teacher.db.insertRow(session, teacher);
  }

  //Get all teachers
  Future<List<Teacher>> getTeachers(Session session) async {
    return await Teacher.db.find(session);
  }

  //Get teacher by id
  Future<Teacher?> getTeacherById(Session session, int id) async {
    return await Teacher.db.findById(session, id);
  }

  //Update teacher by id
  Future<Teacher?> updateTeacherById(Session session, int id, Teacher teacher) async {
    teacher.id = id;
    return await Teacher.db.updateRow(session, teacher);
  }

  //Delete teacher by id
  Future<bool> deleteTeacherById(Session session, int id) async {
    final teacher = await Teacher.db.findById(session, id);
    if (teacher == null) {
      return false;
    }
    await Teacher.db.deleteRow(session, teacher);
    return true;
  }

  //Search teachers
  Future<List<Teacher>> searchTeachers(Session session, {String? name, int? id, String? department, String? designation}) async {
    return await Teacher.db.find(session,
    where: (t) {
      Expression exp = Constant.bool(true);
      if (name != null && name.isNotEmpty) {
        exp = exp & t.teacherName.ilike('%$name%');
      }
      if (id != null) {
        exp = exp & t.id.equals(id);
      }
      if (department != null) {
        exp = exp & t.department.equals(department);
      }
      if (designation != null) {
        exp = exp & t.designation.equals(designation);
      }
      return exp;
    },
    );
  }
}
