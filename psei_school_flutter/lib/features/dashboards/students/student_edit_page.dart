import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // for navigation
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/student_services.dart';

class StudentEditPage extends StatefulWidget {
  final StudentServices service;
  final int studentId;

  const StudentEditPage({
    super.key,
    required this.service,
    required this.studentId,
  });

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController admissionDateController;
  late TextEditingController dobController;

  String? _gender;
  String? _religion;
  String? _nationality;

  Student? _student;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadStudent();
  }

  Future<void> _loadStudent() async {
    final student = await widget.service.getStudentById(widget.studentId);
    if (student != null) {
      setState(() {
        _student = student;
        nameController = TextEditingController(text: student.studentName);
        emailController = TextEditingController(text: student.email);
        phoneController = TextEditingController(text: student.phone);
        addressController = TextEditingController(text: student.address);
        admissionDateController = TextEditingController(
          text: student.admissionDate?.toIso8601String() ?? DateTime.now().toIso8601String(),
        );
        dobController = TextEditingController(
          text: student.dateOfBirth?.toIso8601String() ?? '',
        );
        _gender = student.gender;
        _religion = student.religion;
        _nationality = student.nationality;
        _loading = false;
      });
    }
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = picked.toIso8601String();
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate() && _student != null) {
      final updated = _student!.copyWith(
        studentName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
        admissionDate: DateTime.tryParse(admissionDateController.text),
        dateOfBirth: DateTime.tryParse(dobController.text),
        gender: _gender,
        religion: _religion,
        nationality: _nationality,
      );

      final result = await widget.service.updateStudentById(widget.studentId, updated);

      if (!mounted) return;
      if (result != null) {
        // Update local state so UI reflects changes immediately
        setState(() {
          _student = result;
        });

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Student updated successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(); // close dialog
                  // Navigate directly to all students page
                  context.go('/student-list');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Student already exists or update failed'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Student')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Rather not say', child: Text('Rather not say')),
                ],
                onChanged: (val) => setState(() => _gender = val),
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              DropdownButtonFormField<String>(
                value: _religion,
                items: const [
                  DropdownMenuItem(value: 'Islam', child: Text('Islam')),
                  DropdownMenuItem(value: 'Hindu', child: Text('Hindu')),
                  DropdownMenuItem(value: 'Buddha', child: Text('Buddha')),
                  DropdownMenuItem(value: 'Christian', child: Text('Christian')),
                ],
                onChanged: (val) => setState(() => _religion = val),
                decoration: const InputDecoration(labelText: 'Religion'),
              ),
              DropdownButtonFormField<String>(
                value: _nationality,
                items: _countryList.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (val) => setState(() => _nationality = val),
                decoration: const InputDecoration(labelText: 'Nationality'),
              ),
              TextFormField(
                controller: admissionDateController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Admission Date'),
                onTap: () => _pickDate(admissionDateController),
              ),
              TextFormField(
                controller: dobController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                onTap: () => _pickDate(dobController),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example country list for nationality
const List<String> _countryList = [
  'Bangladesh',
  'India',
  'Nepal',
  'Sri Lanka',
  'Pakistan',
  'USA',
  'UK',
  'Canada',
  'Australia',
  'China',
];
