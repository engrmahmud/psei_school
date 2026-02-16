import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import '../bloc/teacher_bloc.dart';
import '../bloc/teacher_event.dart';
import '../bloc/teacher_state.dart';

class TeacherListPage extends StatefulWidget {
  final Client client;
  const TeacherListPage({
    super.key,
    required this.client
  });

  @override
  State<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState extends State<TeacherListPage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _departmentController = TextEditingController();
  final _designationController = TextEditingController();

  void _search() {
    final name = _nameController.text.trim();
    final idText = _idController.text.trim();
    final department = _departmentController.text.trim();
    final designation = _designationController.text.trim();
    
    // Parse id if provided
    int? id;
    if (idText.isNotEmpty) {
      id = int.tryParse(idText);
    }
    
    // Only search if at least one field has a value
    if (name.isNotEmpty || id != null || department.isNotEmpty || 
        designation.isNotEmpty) {
      context.read<TeacherBloc>().add(SearchTeachers(
        name: name.isNotEmpty ? name : null,
        id: id,
        department: department.isNotEmpty ? department : null,
        designation: designation.isNotEmpty ? designation : null,
      ));
    } else {
      // If no search criteria, load all teachers
      context.read<TeacherBloc>().add(LoadTeachers());
    }
  }

  @override
  void initState() {
    super.initState();
    // Load all teachers initially
    context.read<TeacherBloc>().add(LoadTeachers());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _departmentController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeacherBloc, TeacherState>(
      listener: (context, state) {
        if (state is TeacherError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
        if (state is TeacherSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: AppScaffold(
        title: 'Teachers',
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search filters row aligned to top right
              Align(
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _idController,
                          decoration: const InputDecoration(labelText: 'ID'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _departmentController,
                          decoration: const InputDecoration(labelText: 'Department'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _designationController,
                          decoration: const InputDecoration(labelText: 'Designation'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: _search, child: const Text('Search')),
                    ],
                  ),
                ),
              ),
              const Divider(),
              // Results list
              Expanded(
                child: BlocBuilder<TeacherBloc, TeacherState>(
                  builder: (context, state) {
                    if (state is TeacherLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is TeacherLoaded) {
                      final teachers = state.teachers;
                      return ListView.builder(
                        itemCount: teachers.length,
                        itemBuilder: (_, i) {
                          final t = teachers[i];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              title: Text(t.teacherName),
                              subtitle: Text(
                                  'Department: ${t.department}, Designation: ${t.designation}'),
                              onTap: () => context.go('/teachers/${t.id}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    context.go('/teachers/${t.id}/edit'),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is TeacherError) {
                      return Center(child: Text(state.error));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

