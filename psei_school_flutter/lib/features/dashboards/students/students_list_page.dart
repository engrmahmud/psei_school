import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/student_services.dart';

class StudentsListPage extends StatefulWidget {
  final StudentServices service;

  const StudentsListPage({
    super.key, 
    required this.service
  });

  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _classController = TextEditingController();
  final _sectionController = TextEditingController();
  final _registrationController = TextEditingController();
  final _rollController = TextEditingController();

  List<Student> _students = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadAllStudents(); // load all students initially
  }

  Future<void> _loadAllStudents() async {
    setState(() => _loading = true);
    final results = await widget.service.getStudents(); // fetch all students
    setState(() {
      _students = results;
      _loading = false;
    });
  }

  Future<void> _search() async {
    setState(() => _loading = true);
    final id = _idController.text.isNotEmpty ? int.tryParse(_idController.text) : null;
    final results = await widget.service.searchStudents(
      name: _nameController.text.isNotEmpty ? _nameController.text : null,
      id: id,
      roll: _rollController.text.isNotEmpty ? _rollController.text : null,
      registration: _registrationController.text.isNotEmpty ? _registrationController.text : null,
      studentClass: _classController.text.isNotEmpty ? _classController.text : null,
      section: _sectionController.text.isNotEmpty ? _sectionController.text : null,
    );
    setState(() {
      _students = results;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
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
                        decoration: const InputDecoration(labelText: 'Registration'),
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
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: _sectionController,
                        decoration: const InputDecoration(labelText: 'Section'),
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
                      itemCount: _students.length,
                      itemBuilder: (_, i) {
                        final s = _students[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(s.studentName),
                            subtitle: Text('Class: ${s.studentClass}, Section: ${s.section}'),
                            onTap: () => context.go('/students/${s.id}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => context.go('/students/${s.id}'),
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
