import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';
import '../bloc/teacher_bloc.dart';
import '../bloc/teacher_event.dart';
import '../bloc/teacher_state.dart';

class TeacherEditPage extends StatefulWidget {
  final int teacherId;
  const TeacherEditPage({
    super.key,
    required this.teacherId,
  });

  @override
  State<TeacherEditPage> createState() => _TeacherEditPageState();
}

class _TeacherEditPageState extends State<TeacherEditPage> {
  final _formKey = GlobalKey<FormState>();

  Teacher? _teacher;
  bool _isLoading = true;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController permanentAddressController;
  late TextEditingController joiningDateController;
  late TextEditingController dobController;
  late TextEditingController departmentController;
  late TextEditingController designationController;
  late TextEditingController qualificationController;
  late TextEditingController experienceController;
  late TextEditingController salaryController;
  late TextEditingController fatherNameController;
  late TextEditingController motherNameController;
  late TextEditingController registrationController;
  late TextEditingController passwordController;

  String? _gender;
  String? _religion;
  String? _nationality;
  String? _bloodGroup;
  String? _maritalStatus;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty values
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    permanentAddressController = TextEditingController();
    joiningDateController = TextEditingController();
    dobController = TextEditingController();
    departmentController = TextEditingController();
    designationController = TextEditingController();
    qualificationController = TextEditingController();
    experienceController = TextEditingController();
    salaryController = TextEditingController();
    fatherNameController = TextEditingController();
    motherNameController = TextEditingController();
    registrationController = TextEditingController();
    passwordController = TextEditingController();
    
    // Fetch teacher data
    context.read<TeacherBloc>().add(GetTeacherById(widget.teacherId));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    permanentAddressController.dispose();
    joiningDateController.dispose();
    dobController.dispose();
    departmentController.dispose();
    designationController.dispose();
    qualificationController.dispose();
    experienceController.dispose();
    salaryController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    registrationController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _populateFields(Teacher teacher) {
    final t = teacher;
    nameController.text = t.teacherName;
    emailController.text = t.email;
    phoneController.text = t.phone;
    addressController.text = t.address;
    permanentAddressController.text = t.permanentAddress;
    joiningDateController.text = t.joiningDate.toIso8601String();
    dobController.text = t.dateOfBirth.toIso8601String();
    departmentController.text = t.department;
    designationController.text = t.designation;
    qualificationController.text = t.qualification;
    experienceController.text = t.experience.toString();
    salaryController.text = t.salary.toString();
    fatherNameController.text = t.fatherName;
    motherNameController.text = t.motherName;
    registrationController.text = t.registration;
    passwordController.text = t.password;
    _bloodGroup = t.bloodGroup;
    _gender = t.gender;
    _religion = t.religion;
    _nationality = t.nationality;
    _maritalStatus = t.maritalStatus;
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = picked.toIso8601String();
    }
  }

  void _save() {
    if (_formKey.currentState!.validate() && _teacher != null) {
      final updated = _teacher!.copyWith(
        teacherName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
        permanentAddress: permanentAddressController.text,
        joiningDate: DateTime.tryParse(joiningDateController.text),
        dateOfBirth: DateTime.tryParse(dobController.text),
        department: departmentController.text,
        designation: designationController.text,
        qualification: qualificationController.text,
        experience: int.tryParse(experienceController.text) ?? 0,
        salary: double.tryParse(salaryController.text) ?? 0.0,
        fatherName: fatherNameController.text,
        motherName: motherNameController.text,
        registration: registrationController.text,
        password: passwordController.text,
        bloodGroup: _bloodGroup,
        gender: _gender,
        religion: _religion,
        nationality: _nationality,
        maritalStatus: _maritalStatus,
      );

      context.read<TeacherBloc>().add(UpdateTeacher(_teacher!.id!, updated));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeacherBloc, TeacherState>(
      listener: (context, state) {
        if (state is TeacherLoaded && state.teachers.isNotEmpty) {
          // Populate fields when teacher data is loaded
          setState(() {
            _teacher = state.teachers.first;
            _isLoading = false;
          });
          _populateFields(_teacher!);
        }
        if (state is TeacherSuccess) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Success'),
              content: Text(state.message),
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
        }
        if (state is TeacherError) {
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
        title: 'Edit Teacher',
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
                  decoration: const InputDecoration(labelText: 'Teacher Name'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter name' : null,
                ),
                TextFormField(
                  controller: departmentController,
                  decoration: const InputDecoration(labelText: 'Department'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter department' : null,
                ),
                TextFormField(
                  controller: designationController,
                  decoration: const InputDecoration(labelText: 'Designation'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter designation' : null,
                ),
                TextFormField(
                  controller: qualificationController,
                  decoration: const InputDecoration(labelText: 'Qualification'),
                ),
                TextFormField(
                  controller: experienceController,
                  decoration: const InputDecoration(labelText: 'Experience (years)'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: salaryController,
                  decoration: const InputDecoration(labelText: 'Salary'),
                  keyboardType: TextInputType.number,
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
                TextFormField(
                  controller: permanentAddressController,
                  decoration: const InputDecoration(labelText: 'Permanent Address'),
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
                    DropdownMenuItem(value: 'AB-', child: Text('AB-')),
                  ],
                  onChanged: (val) => setState(() => _bloodGroup = val),
                  decoration: const InputDecoration(labelText: 'Blood Group'),
                ),
                DropdownButtonFormField<String>(
                  value: _maritalStatus,
                  items: const [
                    DropdownMenuItem(value: 'Single', child: Text('Single')),
                    DropdownMenuItem(value: 'Married', child: Text('Married')),
                    DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
                    DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
                  ],
                  onChanged: (val) => setState(() => _maritalStatus = val),
                  decoration: const InputDecoration(labelText: 'Marital Status'),
                ),
                TextFormField(
                  controller: joiningDateController,
                  readOnly: true,
                  decoration:
                      const InputDecoration(labelText: 'Joining Date'),
                  onTap: () => _pickDate(joiningDateController),
                ),
                TextFormField(
                  controller: dobController,
                  readOnly: true,
                  decoration:
                      const InputDecoration(labelText: 'Date of Birth'),
                  onTap: () => _pickDate(dobController),
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

