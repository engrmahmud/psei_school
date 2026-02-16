import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../bloc/student_state.dart';

class StudentDetailPage extends StatefulWidget {
  final int studentId;

  const StudentDetailPage({
    super.key,
    required this.studentId,
  });

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch event to load student by ID
    context.read<StudentBloc>().add(GetStudentById(widget.studentId));
  }

  void _confirmDelete(int id) async {
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
      context.read<StudentBloc>().add(DeleteStudent(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is StudentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          if (state.message.contains('deleted')) {
            context.go('/student-list');
          }
        }
        if (state is StudentError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: AppScaffold(
        title: 'Student Details',
        body: BlocBuilder<StudentBloc, StudentState>(
          builder: (context, state) {
            if (state is StudentLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is StudentLoaded && state.students.isNotEmpty) {
              final student = state.students.first;
              return Center(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(student.studentName,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text('Email: ${student.email}'),
                        Text('Phone: ${student.phone}'),
                        Text('Address: ${student.address}'),
                        Text('Class: ${student.studentClass}'),
                        Text('Section: ${student.section}'),
                        Text('Roll: ${student.roll}'),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await context.push('/students/${student.id}/edit');
                                // After editing, reload student details
                                context.read<StudentBloc>().add(GetStudentById(student.id!));
                              },
                              child: const Text('Edit'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => _confirmDelete(student.id!),
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
              );
            }
            if (state is StudentError) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text('Student not found'));
          },
        ),
      ),
    );
  }
}
