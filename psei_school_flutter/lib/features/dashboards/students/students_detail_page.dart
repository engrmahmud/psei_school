import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/student_services.dart';

class StudentDetailPage extends StatefulWidget {
  final StudentServices service;
  final int studentId;

  const StudentDetailPage({
    super.key,
    required this.service,
    required this.studentId,
  });

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  Student? _student;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadStudent();
  }

  Future<void> _loadStudent() async {
    final student = await widget.service.getStudentById(widget.studentId);
    setState(() {
      _student = student;
      _loading = false;
    });
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this student?'),
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
      final success = await widget.service.deleteStudentById(widget.studentId);
      if (!mounted) return;
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student deleted successfully')),
        );
        context.go('/student-list'); // back to all students page
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

    if (_student == null) {
      return const Scaffold(
        body: Center(child: Text('Student not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_student!.studentName,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Email: ${_student!.email}'),
                Text('Phone: ${_student!.phone}'),
                Text('Address: ${_student!.address}'),
                Text('Class: ${_student!.studentClass}'),
                Text('Section: ${_student!.section}'),
                Text('Roll: ${_student!.roll}'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // Navigate to edit page
                        await context.push('/students/${_student!.id}/edit');
                        // After editing, reload student details
                        _loadStudent();
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
    );
  }
}
