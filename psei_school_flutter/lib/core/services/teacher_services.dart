import 'package:psei_school_client/psei_school_client.dart';

class TeacherServices {
  final Client client;

  TeacherServices(this.client);


  // Get all teachers
  Future<List<Teacher>> getTeachers() async {
    return await client.teacherEndpoints.getTeachers();
  }

  // get teacher by id
  Future<Teacher?> getTeacherById(int id) async {
    return await client.teacherEndpoints.getTeacherById(id);
  } 


  // update teacher by id     
  Future<Teacher?> updateTeacherById(int id, Teacher teacher) async {
    return await client.teacherEndpoints.updateTeacherById(id, teacher);
  } 

  // delete teacher by id
  Future<bool> deleteTeacherById(int id) async {
    return await client.teacherEndpoints.deleteTeacherById(id);
  }

  // search teachers
  Future<List<Teacher>> searchTeachers({String? name, int? id, String? department, String? designation, String? registration}) async {
    return await client.teacherEndpoints.searchTeachers(
      name: name,
      id: id,
      department: department,
      designation: designation,

    );
  }
}


