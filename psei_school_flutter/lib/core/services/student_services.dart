import 'package:psei_school_client/psei_school_client.dart';

class StudentServices {
  final Client client;

  StudentServices(this.client);


  // Get all students
  Future<List<Student>> getStudents() async {
    return await client.studentEndpoints.getStudents();
  }

  // get student by id
  Future<Student?> getStudentById(int id) async {
    return await client.studentEndpoints.getStudentById(id);
  } 


  // update student by id
  Future<Student?> updateStudentById(int id, Student student) async {
    return await client.studentEndpoints.updateStudentById(id, student);
  }

  // delete student by id
  Future<bool> deleteStudentById(int id) async {
    return await client.studentEndpoints.deleteStudentById(id);
  }
  
  // search students
  Future<List<Student>> searchStudents({String? name, int? id, String? roll, String? registration, String? studentClass, String? section}) async {
    return await client.studentEndpoints.searchStudents(
      name: name,
      id: id,
      roll: roll,
      registration: registration,
      studentClass: studentClass,
    );
  }


}


