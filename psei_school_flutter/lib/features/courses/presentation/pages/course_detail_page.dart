import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_event.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_state.dart';
import 'package:psei_school_flutter/features/courses/presentation/pages/course_edit_page.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({
    super.key,
    required this.course,
  });

  void _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text('Are you sure you want to delete ${course.courseName}?'),
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

    if (confirmed == true && context.mounted) {
      context.read<CourseBloc>().add(DeleteCourse(course.id!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseBloc, CourseState>(
      listener: (context, state) {
        if (state is CourseSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          if (state.message.contains('deleted')) {
            Navigator.pop(context);
          }
        }
        if (state is CourseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: AppScaffold(
        title: 'Course Details',
        body: Center(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    course.courseName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildDetailRow('Subject Code', course.subjectCode),
                  _buildDetailRow('Class Level', 'Class ${course.classLevel}'),
                  _buildDetailRow('Teacher ID', course.teacherId.toString()),
                  if (course.description != null && course.description!.isNotEmpty)
                    _buildDetailRow('Description', course.description!),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseEditPage(course: course),
                            ),
                          );
                        },
                        child: const Text('Edit'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => _confirmDelete(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

