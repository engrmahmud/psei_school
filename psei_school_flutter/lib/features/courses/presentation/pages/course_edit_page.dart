import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_bloc.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_event.dart';
import 'package:psei_school_flutter/features/courses/presentation/bloc/course_state.dart';

class CourseEditPage extends StatefulWidget {
  final Course course;
  const CourseEditPage({super.key, required this.course});

  @override
  State<CourseEditPage> createState() => _CourseEditPageState();
}

class _CourseEditPageState extends State<CourseEditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _courseNameController;
  late TextEditingController _subjectCodeController;
  late TextEditingController _descriptionController;
  late int _classLevel;
  late int _teacherId;

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController(text: widget.course.courseName);
    _subjectCodeController = TextEditingController(text: widget.course.subjectCode);
    _descriptionController = TextEditingController(text: widget.course.description ?? '');
    _classLevel = widget.course.classLevel;
    _teacherId = widget.course.teacherId;
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _subjectCodeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Course'),
      ),
      body: BlocListener<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is CourseSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.read<CourseBloc>().add(LoadCourses());
            Navigator.pop(context);
          }
          if (state is CourseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _courseNameController,
                  decoration: const InputDecoration(
                    labelText: 'Course Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _subjectCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Subject Code',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int>(
                  value: _classLevel,
                  decoration: const InputDecoration(
                    labelText: 'Class Level',
                    border: OutlineInputBorder(),
                  ),
                  items: List.generate(12, (index) => index + 1)
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text('Class $level'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _classLevel = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _teacherId.toString(),
                  decoration: const InputDecoration(
                    labelText: 'Teacher ID',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _teacherId = int.tryParse(value) ?? 1;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter teacher ID';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is CourseLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                final course = Course(
                                  id: widget.course.id,
                                  courseName: _courseNameController.text,
                                  subjectCode: _subjectCodeController.text,
                                  description: _descriptionController.text.isEmpty
                                      ? null
                                      : _descriptionController.text,
                                  classLevel: _classLevel,
                                  teacherId: _teacherId,
                                );
                                context.read<CourseBloc>().add(
                                  UpdateCourse(widget.course.id!, course),
                                );
                              }
                            },
                      child: state is CourseLoading
                          ? const CircularProgressIndicator()
                          : const Text('Update'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

