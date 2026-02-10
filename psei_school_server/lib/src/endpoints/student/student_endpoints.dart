
import 'package:psei_school_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class StudentEndpoints extends Endpoint{

  //Create student by admission
  Future<Student> createStudent(Session session, Student student) async {
    return await Student.db.insertRow(session, student);
  }

  //Get all students
  Future<List<Student>> getStudents(Session session) async {
    return await Student.db.find(session);
  }

  //Get student by id
  Future<Student?> getStudentById(Session session, int id) async {
    return await Student.db.findById(session, id);
  }

  //Update student by id
  Future<Student?> updateStudentById(Session session, int id, Student student) async {
    student.id = id;
    return await Student.db.updateRow(session, student);
  }

  //Delete student by id
  Future<bool> deleteStudentById(Session session, int id) async {
    final student = await Student.db.findById(session, id);
    if (student == null) {
      return false;
    }
    await Student.db.deleteRow(session, student);
    return true;
  }

  //Search students
  Future<List<Student>> searchStudents(Session session, {String? name, int? id, String? roll, String? registration, String? studentClass}) async {
    return await Student.db.find(session,
    where: (s) {
      Expression exp = Constant.bool(true);
      if (name != null && name.isNotEmpty) {
        exp = exp & s.studentName.ilike('%$name%');
      }
      if (id != null) {
        exp = exp & s.id.equals(id);
      }
      if (roll != null) {
        exp = exp & s.roll.equals(roll);
      }
      if (registration != null) {
        exp = exp & s.registration.equals(registration);
      }
      if (studentClass != null) {
        exp = exp & s.studentClass.equals(studentClass);
      }
      return exp;
    },
    );
  }
}
