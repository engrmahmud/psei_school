import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/teacher_services.dart';

class TeacherListPage extends StatefulWidget {
  final TeacherServices service;

  const TeacherListPage({super.key, required this.service});

  @override
  State<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState extends State<TeacherListPage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _departmentController = TextEditingController();
  final _designationController = TextEditingController();
  final _registrationController = TextEditingController();

  List<Teacher> _teachers = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadAllTeachers(); // load all teachers initially
  }

  Future<void> _loadAllTeachers() async {
    setState(() => _loading = true);
    final results = await widget.service.getTeachers(); // fetch all teachers
    setState(() {
      _teachers = results;
      _loading = false;
    });
  }

  Future<void> _search() async {
    setState(() => _loading = true);
    final id = _idController.text.isNotEmpty ? int.tryParse(_idController.text) : null;
    final results = await widget.service.searchTeachers(
      name: _nameController.text.isNotEmpty ? _nameController.text : null,
      id: id,
      department: _departmentController.text.isNotEmpty ? _departmentController.text : null,
      designation: _designationController.text.isNotEmpty ? _designationController.text : null,
      registration: _registrationController.text.isNotEmpty ? _registrationController.text : null,
    );
    setState(() {
      _teachers = results;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
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
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _registrationController,
                        decoration: const InputDecoration(labelText: 'Registration'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: _search, child: const Text('Search')),
                  ],
                ),
              ),
            ),
            const Divider(),
            // Results list
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _teachers.length,
                      itemBuilder: (_, i) {
                        final t = _teachers[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(t.teacherName),
                            subtitle: Text('${t.department} • ${t.designation}'),
                            onTap: () => context.go('/teachers/${t.id}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => context.go('/teachers/${t.id}/edit'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
