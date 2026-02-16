import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_event.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_state.dart';
import 'course_detail_page.dart';
import 'course_edit_page.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  @override
  void initState() {
    super.initState();
    // Load courses when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseBloc>().add(LoadCourses());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Courses',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<CourseBloc>().add(LoadCourses());
          },
        ),
      ],
      body: Stack(
        children: [
          BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CourseError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.error}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CourseBloc>().add(LoadCourses());
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }
              if (state is CourseLoaded) {
                if (state.courses.isEmpty) {
                  return const Center(child: Text('No courses found'));
                }
                return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    final course = state.courses[index];
                    return Card(
                      child: ListTile(
                        title: Text(course.courseName),
                        subtitle: Text('Code: ${course.subjectCode} | Class: ${course.classLevel}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseEditPage(course: course),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _showDeleteDialog(context, course);
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailPage(course: course),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text('Welcome to Courses'));
            },
          ),















        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Course course) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Course'),
        content: Text('Are you sure you want to delete ${course.courseName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<CourseBloc>().add(DeleteCourse(course.id!));
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

