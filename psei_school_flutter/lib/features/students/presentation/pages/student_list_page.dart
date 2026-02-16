import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../bloc/student_state.dart';

class StudentListPage extends StatefulWidget {
  final Client client;
  const StudentListPage({
    super.key, 
    required this.client
  });

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _classController = TextEditingController();
  final _registrationController = TextEditingController();
  final _rollController = TextEditingController();

  void _search() {
    final name = _nameController.text.trim();
    final idText = _idController.text.trim();
    final roll = _rollController.text.trim();
    final registration = _registrationController.text.trim();
    final studentClass = _classController.text.trim();
    
    // Parse id if provided
    int? id;
    if (idText.isNotEmpty) {
      id = int.tryParse(idText);
    }
    
    // Only search if at least one field has a value
    if (name.isNotEmpty || id != null || roll.isNotEmpty || 
        registration.isNotEmpty || studentClass.isNotEmpty) {
      context.read<StudentBloc>().add(SearchStudents(
        name: name.isNotEmpty ? name : null,
        id: id,
        roll: roll.isNotEmpty ? roll : null,
        registration: registration.isNotEmpty ? registration : null,
        studentClass: studentClass.isNotEmpty ? studentClass : null,
      ));
    } else {
      // If no search criteria, load all students
      context.read<StudentBloc>().add(LoadStudents());
    }
  }

  @override
  void initState() {
    super.initState();
    // Load all students initially
    context.read<StudentBloc>().add(LoadStudents());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is StudentError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
        if (state is StudentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: AppScaffold(
        title: 'Students',
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
                        width: 120,
                        child: TextField(
                          controller: _rollController,
                          decoration: const InputDecoration(labelText: 'Roll'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _registrationController,
                          decoration:
                              const InputDecoration(labelText: 'Registration'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 120,
                        child: TextField(
                          controller: _classController,
                          decoration: const InputDecoration(labelText: 'Class'),
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
                child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is StudentLoaded) {
                      final students = state.students;
                      return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (_, i) {
                          final s = students[i];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              title: Text(s.studentName),
                              subtitle: Text(
                                  'Class: ${s.studentClass}, Section: ${s.section}'),
                              onTap: () => context.go('/students/${s.id}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    context.go('/students/${s.id}/edit'),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is StudentError) {
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
