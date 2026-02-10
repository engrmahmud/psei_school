import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/teacher_services.dart';

class TeacherDetailsPage extends StatefulWidget {
  final TeacherServices service;
  final int teacherId;

  const TeacherDetailsPage({
    super.key,
    required this.service,
    required this.teacherId,
  });

  @override
  State<TeacherDetailsPage> createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends State<TeacherDetailsPage> {
  Teacher? _teacher;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTeacher();
  }

  Future<void> _loadTeacher() async {
    final teacher = await widget.service.getTeacherById(widget.teacherId);
    setState(() {
      _teacher = teacher;
      _loading = false;
    });
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this teacher?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await widget.service.deleteTeacherById(widget.teacherId);
      if (!mounted) return;
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Teacher deleted successfully')),
        );
        context.go('/teacher-list'); // back to all teachers page
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Delete failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_teacher == null) {
      return const Scaffold(
        body: Center(child: Text('Teacher not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Details')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_teacher!.teacherName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Department: ${_teacher!.department}'),
                  Text('Designation: ${_teacher!.designation}'),
                  Text('Qualification: ${_teacher!.qualification}'),
                  Text('Email: ${_teacher!.email}'),
                  Text('Phone: ${_teacher!.phone}'),
                  Text('Address: ${_teacher!.address}'),
                  Text('Permanent Address: ${_teacher!.permanentAddress}'),
                  Text('Nationality: ${_teacher!.nationality}'),
                  Text('Religion: ${_teacher!.religion}'),
                  Text('Gender: ${_teacher!.gender}'),
                  Text('Blood Group: ${_teacher!.bloodGroup}'),
                  Text('Father: ${_teacher!.fatherName}'),
                  Text('Mother: ${_teacher!.motherName}'),
                  Text('Experience: ${_teacher!.experience} years'),
                  Text('Salary: ${_teacher!.salary}'),
                  Text('Marital Status: ${_teacher!.maritalStatus}'),
                  Text('Joining Date: ${_teacher!.joiningDate.toLocal().toString().split(' ')[0]}'),
                  Text('Date of Birth: ${_teacher!.dateOfBirth.toLocal().toString().split(' ')[0]}'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Navigate to edit page
                          await context.push('/teachers/${_teacher!.id}/edit');
                          // After editing, reload teacher details
                          _loadTeacher();
                        },
                        child: const Text('Edit'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _confirmDelete,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
