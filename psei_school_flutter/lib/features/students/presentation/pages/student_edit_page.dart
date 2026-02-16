import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../bloc/student_state.dart';

class StudentEditPage extends StatefulWidget {
  final int studentId;
  const StudentEditPage({
    super.key,
    required this.studentId,
  });

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  final _formKey = GlobalKey<FormState>();

  Student? _student;
  bool _isLoading = true;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController admissionDateController;
  late TextEditingController dobController;
  late TextEditingController academicYearController;
  late TextEditingController fatherNameController;
  late TextEditingController motherNameController;
  late TextEditingController studentClassController;
  late TextEditingController sectionController;
  late TextEditingController rollController;
  late TextEditingController registrationController;
  late TextEditingController passwordController;


  String? _gender;
  String? _religion;
  String? _nationality;
  String? _bloodGroup;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty values
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    admissionDateController = TextEditingController();
    dobController = TextEditingController();
    academicYearController = TextEditingController();
    fatherNameController = TextEditingController();
    motherNameController = TextEditingController();
    studentClassController = TextEditingController();
    sectionController = TextEditingController();
    rollController = TextEditingController();
    registrationController = TextEditingController();
    passwordController = TextEditingController();
   
    
    // Fetch student data
    context.read<StudentBloc>().add(GetStudentById(widget.studentId));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    admissionDateController.dispose();
    dobController.dispose();
    academicYearController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    studentClassController.dispose();
    sectionController.dispose();
    rollController.dispose();
    registrationController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _populateFields(Student student) {
    final s = student;
    nameController.text = s.studentName;
    emailController.text = s.email;
    phoneController.text = s.phone;
    addressController.text = s.address;
    admissionDateController.text = s.admissionDate.toIso8601String();
    dobController.text = s.dateOfBirth.toIso8601String();
    academicYearController.text = s.academicYear;
    fatherNameController.text = s.fatherName;
    motherNameController.text = s.motherName;
    studentClassController.text = s.studentClass;
    sectionController.text = s.section;
    rollController.text = s.roll;
    registrationController.text = s.registration;
    passwordController.text = s.password;
    _bloodGroup = s.bloodGroup;
    _gender = s.gender;
    _religion = s.religion;
    _nationality = s.nationality;
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

  void _save() {
    if (_formKey.currentState!.validate() && _student != null) {
      final updated = _student!.copyWith(
        studentName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
        admissionDate: DateTime.tryParse(admissionDateController.text),
        dateOfBirth: DateTime.tryParse(dobController.text),
        academicYear: academicYearController.text,
        fatherName: fatherNameController.text,
        motherName: motherNameController.text,
        studentClass: studentClassController.text,
        section: sectionController.text,
        roll: rollController.text,
        registration: registrationController.text,
        password: passwordController.text,
        bloodGroup: _bloodGroup,
        gender: _gender,
        religion: _religion,
        nationality: _nationality,
      );

      context.read<StudentBloc>().add(UpdateStudent(_student!.id!, updated));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is StudentLoaded && state.students.isNotEmpty) {
          // Populate fields when student data is loaded
          setState(() {
            _student = state.students.first;
            _isLoading = false;
          });
          _populateFields(_student!);
        }
        if (state is StudentSuccess) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Success'),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.go('/student-list');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        if (state is StudentError) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text(state.error),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: AppScaffold(
        title: 'Edit Student',
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter name' : null,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter email' : null,
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
                    DropdownMenuItem(
                        value: 'Rather not say', child: Text('Rather not say')),
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
                  items: _countryList
                      .map((c) =>
                          DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (val) => setState(() => _nationality = val),
                  decoration: const InputDecoration(labelText: 'Nationality'),
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
                    DropdownMenuItem(value: 'AB-', child: Text('AB-')),                  ],
                  onChanged: (val) => setState(() => _bloodGroup = val),
                  decoration: const InputDecoration(labelText: 'Blood Group'),
                ),   
                TextFormField(
                  controller: admissionDateController,
                  readOnly: true,
                  decoration:
                      const InputDecoration(labelText: 'Admission Date'),
                  onTap: () => _pickDate(admissionDateController),
                ),
                TextFormField(
                  controller: dobController,
                  readOnly: true,
                  decoration:
                      const InputDecoration(labelText: 'Date of Birth'),
                  onTap: () => _pickDate(dobController),
                ),
                TextFormField(
                  controller: academicYearController,
                  decoration: const InputDecoration(labelText: 'Academic Year'),
                ),
                TextFormField(
                  controller: fatherNameController,
                  decoration: const InputDecoration(labelText: 'Father Name'),
                ),
                TextFormField(
                  controller: motherNameController,
                  decoration: const InputDecoration(labelText: 'Mother Name'),
                ),
                TextFormField(
                  controller: studentClassController,
                  decoration: const InputDecoration(labelText: 'Class'),
                ),
                TextFormField(
                  controller: sectionController,
                  decoration: const InputDecoration(labelText: 'Section'),
                ),
                TextFormField(
                  controller: rollController,
                  decoration: const InputDecoration(labelText: 'Roll'),
                ),
                TextFormField(
                  controller: registrationController,
                  decoration: const InputDecoration(labelText: 'Registration'),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
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
