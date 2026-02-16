import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';

class CourseAdmissionPage extends StatefulWidget {
  final Client client;
  const CourseAdmissionPage({
    super.key, 
    required this.client
  });

  @override
  State<CourseAdmissionPage> createState() => _CourseAdmissionPageState();
}

class _CourseAdmissionPageState extends State<CourseAdmissionPage> {
  final _formKey = GlobalKey<FormState>();
  final _courseNameController = TextEditingController();
  final _subjectCodeController = TextEditingController();
  final _descriptionController = TextEditingController();
  int _classLevel = 1;
  int _teacherId = 1;
  bool _isLoading = false;

  @override
  void dispose() {
    _courseNameController.dispose();
    _subjectCodeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final course = Course(
          courseName: _courseNameController.text.trim(),
          subjectCode: _subjectCodeController.text.trim(),
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          classLevel: _classLevel,
          teacherId: _teacherId,
        );

        await widget.client.courseEndpoints.createCourse(course);
        
        if (mounted) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Course created successfully'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.go('/course-list');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to create course: $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Add Course',
      body: SingleChildScrollView(
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
              ElevatedButton(
                onPressed: _isLoading ? null : _save,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

