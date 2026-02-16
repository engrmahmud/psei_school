import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import '../bloc/teacher_bloc.dart';
import '../bloc/teacher_event.dart';
import '../bloc/teacher_state.dart';

class TeacherDetailPage extends StatefulWidget {
  final int teacherId;

  const TeacherDetailPage({
    super.key,
    required this.teacherId,
  });

  @override
  State<TeacherDetailPage> createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends State<TeacherDetailPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch event to load teacher by ID
    context.read<TeacherBloc>().add(GetTeacherById(widget.teacherId));
  }

  void _confirmDelete(int id) async {
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
      context.read<TeacherBloc>().add(DeleteTeacher(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeacherBloc, TeacherState>(
      listener: (context, state) {
        if (state is TeacherSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          if (state.message.contains('deleted')) {
            context.go('/teacher-list');
          }
        }
        if (state is TeacherError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: AppScaffold(
        title: 'Teacher Details',
        body: BlocBuilder<TeacherBloc, TeacherState>(
          builder: (context, state) {
            if (state is TeacherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TeacherLoaded && state.teachers.isNotEmpty) {
              final teacher = state.teachers.first;
              return Center(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(teacher.teacherName,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text('Department: ${teacher.department}'),
                        Text('Designation: ${teacher.designation}'),
                        Text('Qualification: ${teacher.qualification}'),
                        Text('Experience: ${teacher.experience} years'),
                        Text('Salary: ${teacher.salary}'),
                        Text('Email: ${teacher.email}'),
                        Text('Phone: ${teacher.phone}'),
                        Text('Address: ${teacher.address}'),
                        Text('Gender: ${teacher.gender}'),
                        Text('Religion: ${teacher.religion}'),
                        Text('Blood Group: ${teacher.bloodGroup}'),
                        Text('Marital Status: ${teacher.maritalStatus}'),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await context.push('/teachers/${teacher.id}/edit');
                                // After editing, reload teacher details
                                context.read<TeacherBloc>().add(GetTeacherById(teacher.id!));
                              },
                              child: const Text('Edit'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => _confirmDelete(teacher.id!),
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
            if (state is TeacherError) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text('Teacher not found'));
          },
        ),
      ),
    );
  }
}

