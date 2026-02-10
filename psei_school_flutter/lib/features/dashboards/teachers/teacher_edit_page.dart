import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/services/teacher_services.dart';

class TeacherEditPage extends StatefulWidget {
  final TeacherServices service;
  final int teacherId;

  const TeacherEditPage({
    super.key,
    required this.service,
    required this.teacherId,
  });

  @override
  State<TeacherEditPage> createState() => _TeacherEditPageState();
}

class _TeacherEditPageState extends State<TeacherEditPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController permanentAddressController;
  late TextEditingController departmentController;
  late TextEditingController designationController;
  late TextEditingController qualificationController;
  late TextEditingController registrationController;
  late TextEditingController experienceController;
  late TextEditingController salaryController;
  late TextEditingController joiningDateController;
  late TextEditingController dobController;

  String? _gender;
  String? _religion;
  String? _bloodGroup;
  String? _nationality;
  String? _maritalStatus;

  Teacher? _teacher;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTeacher();
  }

  Future<void> _loadTeacher() async {
    final teacher = await widget.service.getTeacherById(widget.teacherId);
    if (teacher != null) {
      setState(() {
        _teacher = teacher;
        nameController = TextEditingController(text: teacher.teacherName);
        emailController = TextEditingController(text: teacher.email);
        phoneController = TextEditingController(text: teacher.phone);
        addressController = TextEditingController(text: teacher.address);
        permanentAddressController = TextEditingController(text: teacher.permanentAddress);
        departmentController = TextEditingController(text: teacher.department);
        designationController = TextEditingController(text: teacher.designation);
        qualificationController = TextEditingController(text: teacher.qualification);
        registrationController = TextEditingController(text: teacher.registration);
        experienceController = TextEditingController(text: teacher.experience.toString());
        salaryController = TextEditingController(text: teacher.salary.toString());
        joiningDateController = TextEditingController(
          text: teacher.joiningDate.toIso8601String(),
        );
        dobController = TextEditingController(
          text: teacher.dateOfBirth.toIso8601String(),
        );
        _gender = teacher.gender;
        _religion = teacher.religion;
        _bloodGroup = teacher.bloodGroup;
        _nationality = teacher.nationality;
        _maritalStatus = teacher.maritalStatus;
        _loading = false;
      });
    }
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = picked.toIso8601String();
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate() && _teacher != null) {
      final updated = _teacher!.copyWith(
        teacherName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
        permanentAddress: permanentAddressController.text,
        department: departmentController.text,
        designation: designationController.text,
        qualification: qualificationController.text,
        registration: registrationController.text,
        experience: int.tryParse(experienceController.text) ?? 0,
        salary: double.tryParse(salaryController.text) ?? 0.0,
        joiningDate: DateTime.tryParse(joiningDateController.text),
        dateOfBirth: DateTime.tryParse(dobController.text),
        gender: _gender,
        religion: _religion,
        bloodGroup: _bloodGroup,
        nationality: _nationality,
        maritalStatus: _maritalStatus,
      );

      final result = await widget.service.updateTeacherById(widget.teacherId, updated);

      if (!mounted) return;
      if (result != null) {
        setState(() {
          _teacher = result;
        });

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Teacher updated successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.go('/teacher-list');
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
            content: const Text('Update failed'),
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
      appBar: AppBar(title: const Text('Edit Teacher')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextFormField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
              TextFormField(controller: phoneController, decoration: const InputDecoration(labelText: 'Phone')),
              TextFormField(controller: addressController, decoration: const InputDecoration(labelText: 'Address')),
              TextFormField(controller: permanentAddressController, decoration: const InputDecoration(labelText: 'Permanent Address')),
              TextFormField(controller: departmentController, decoration: const InputDecoration(labelText: 'Department')),
              TextFormField(controller: designationController, decoration: const InputDecoration(labelText: 'Designation')),
              TextFormField(controller: qualificationController, decoration: const InputDecoration(labelText: 'Qualification')),
              TextFormField(controller: registrationController, decoration: const InputDecoration(labelText: 'Registration')),
              TextFormField(controller: experienceController, decoration: const InputDecoration(labelText: 'Experience')),
              TextFormField(controller: salaryController, decoration: const InputDecoration(labelText: 'Salary')),

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
                value: _bloodGroup,
                items: const [
                  DropdownMenuItem(value: 'A+', child: Text('A+')),
                  DropdownMenuItem(value: 'A-', child: Text('A-')),
                  DropdownMenuItem(value: 'B+', child: Text('B+')),
                  DropdownMenuItem(value: 'B-', child: Text('B-')),
                  DropdownMenuItem(value: 'O+', child: Text('O+')),
                  DropdownMenuItem(value: 'O-', child: Text('O-')),
                  DropdownMenuItem(value: 'AB+', child: Text('AB+')),
                  DropdownMenuItem(value: 'AB-', child: Text('AB-')),
                ],
                onChanged: (val) => setState(() => _bloodGroup = val),
                decoration: const InputDecoration(labelText: 'Blood Group'),
              ),
              DropdownButtonFormField<String>(
                value: _nationality,
                items: _countryList.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (val) => setState(() => _nationality = val),
                decoration: const InputDecoration(labelText: 'Nationality'),
              ),
              DropdownButtonFormField<String>(
                value: _maritalStatus,
                items: const [
                  DropdownMenuItem(value: 'Single', child: Text('Single')),
                  DropdownMenuItem(value: 'Married', child: Text('Married')),
                  DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
                ],
                onChanged: (val) => setState(() => _maritalStatus = val),
                decoration: const InputDecoration(labelText: 'Marital Status'),
              ),         
              TextFormField(
                controller: joiningDateController,
                decoration: const InputDecoration(labelText: 'Joining Date'),
                readOnly: true,
                onTap: () => _pickDate(joiningDateController),
              ),
              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                readOnly: true,
                onTap: () => _pickDate(dobController),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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



