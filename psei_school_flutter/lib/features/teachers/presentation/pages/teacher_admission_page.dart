import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/responsive/app_scaffold.dart';

class TeacherAdmissionPage extends StatefulWidget {
  final Client client;
  const TeacherAdmissionPage({
    super.key,
    required this.client
  });

  @override
  State<TeacherAdmissionPage> createState() => _TeacherAdmissionPageState();
}

class _TeacherAdmissionPageState extends State<TeacherAdmissionPage> {
  final formkey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController teachername = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final TextEditingController qualification = TextEditingController();
  final TextEditingController experience = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController permanentAddress = TextEditingController();
  final TextEditingController registration = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Dropdown values
  String? _gender;
  String? _religion;
  String? _nationality;
  String? _bloodGroup;
  String? _maritalStatus;

  @override
  void initState() {
    super.initState();
    experience.text = '0';
    salary.text = '0';
  }

  @override
  void dispose() {
    teachername.dispose();
    department.dispose();
    designation.dispose();
    qualification.dispose();
    experience.dispose();
    salary.dispose();
    fatherName.dispose();
    motherName.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    permanentAddress.dispose();
    registration.dispose();
    password.dispose();
    super.dispose();
  }

  // Date pickers
  DateTime _joiningDate = DateTime.now();
  DateTime? _dob;

  Future<void> _pickDate(BuildContext context, bool isDob) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isDob ? DateTime(1970) : DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isDob) {
          _dob = picked;
        } else {
          _joiningDate = picked;
        }
      });
    }
  }

  Future<void> _save() async {
    if (formkey.currentState!.validate()) {
      final teacher = Teacher(
        teacherName: teachername.text.trim(),
        department: department.text.trim(),
        designation: designation.text.trim(),
        qualification: qualification.text.trim(),
        joiningDate: _joiningDate,
        dateOfBirth: _dob ?? DateTime.now(),
        gender: _gender ?? '',
        religion: _religion ?? '',
        bloodGroup: _bloodGroup ?? '',
        nationality: _nationality ?? '',
        fatherName: fatherName.text.trim(),
        motherName: motherName.text.trim(),
        email: email.text.trim(),
        phone: phone.text.trim(),
        address: address.text.trim(),
        permanentAddress: permanentAddress.text.trim(),
        registration: registration.text.trim(),
        password: password.text.trim(),
        experience: int.tryParse(experience.text.trim()) ?? 0,
        maritalStatus: _maritalStatus ?? '',
        salary: double.tryParse(salary.text.trim()) ?? 0.0,
      );

      try {
        await widget.client.teacherEndpoints.createTeacher(teacher);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Teacher added successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.go('/');
                },
                child: const Text('OK'),
              ),
            ]
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: Text('Teacher already exists or failed: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.go('/teacher-recruitment');
                },
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
    return AppScaffold(
      title: 'Teacher Recruitment',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              // Teacher Name
              TextFormField(
                controller: teachername,
                decoration: const InputDecoration(labelText: 'Teacher Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter teacher name' : null,
              ),
              const SizedBox(height: 16),

              // Department + Designation
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: department,
                      decoration: const InputDecoration(labelText: 'Department'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter department' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: designation,
                      decoration: const InputDecoration(labelText: 'Designation'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter designation' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Qualification
              TextFormField(
                controller: qualification,
                decoration: const InputDecoration(labelText: 'Qualification'),
                validator: (v) => v == null || v.isEmpty ? 'Enter qualification' : null,
              ),
              const SizedBox(height: 16),

              // Experience + Salary
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: experience,
                      decoration: const InputDecoration(labelText: 'Experience (years)'),
                      keyboardType: TextInputType.number,
                      validator: (v) => v == null || v.isEmpty ? 'Enter experience' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: salary,
                      decoration: const InputDecoration(labelText: 'Salary'),
                      keyboardType: TextInputType.number,
                      validator: (v) => v == null || v.isEmpty ? 'Enter salary' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Gender dropdown
              DropdownButtonFormField<String>(
                value: _gender,
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Rather not say', child: Text('Rather not say')),
                ],
                onChanged: (val) => setState(() => _gender = val),
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) => value == null ? 'Select gender' : null,
              ),
              const SizedBox(height: 16),

              // Religion dropdown
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
                validator: (value) => value == null ? 'Select religion' : null,
              ),
              const SizedBox(height: 16),

              // Nationality dropdown
              DropdownButtonFormField<String>(
                value: _nationality,
                items: _countryList.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (val) => setState(() => _nationality = val),
                decoration: const InputDecoration(labelText: 'Nationality'),
                validator: (value) => value == null ? 'Select nationality' : null,
              ),
              const SizedBox(height: 16),

              // Marital Status dropdown
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
                validator: (value) => value == null ? 'Select marital status' : null,
              ),
              const SizedBox(height: 16),

              // Joining Date picker
              ListTile(
                title: Text('Joining Date: ${_joiningDate.toLocal().toString().split(' ')[0]}'),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context, false),
                ),
              ),

              // Date of Birth picker
              ListTile(
                title: Text('Date of Birth: ${_dob != null ? _dob!.toLocal().toString().split(' ')[0] : 'Select'}'),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context, true),
                ),
              ),

              // Blood Group dropdown
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
                validator: (value) => value == null ? 'Select blood group' : null,
              ),
              const SizedBox(height: 16),

              // Father's Name
              TextFormField(
                controller: fatherName,
                decoration: const InputDecoration(labelText: "Father's Name"),
                validator: (v) => v == null || v.isEmpty ? "Enter father's name" : null,
              ),

              // Mother's Name
              TextFormField(
                controller: motherName,
                decoration: const InputDecoration(labelText: "Mother's Name"),
                validator: (v) => v == null || v.isEmpty ? "Enter mother's name" : null,
              ),

              // Email
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
              ),

              // Phone
              TextFormField(
                controller: phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (v) => v == null || v.isEmpty ? 'Enter phone number' : null,
              ),

              // Address
              TextFormField(
                controller: address,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter address' : null,
              ),

              // Permanent Address
              TextFormField(
                controller: permanentAddress,
                decoration: const InputDecoration(labelText: 'Permanent Address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter permanent address' : null,
              ),

              // Registration
              TextFormField(
                controller: registration,
                decoration: const InputDecoration(labelText: 'Registration'),
                validator: (v) => v == null || v.isEmpty ? 'Enter registration number' : null,
              ),

              // Password
              TextFormField(
                controller: password,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) => v == null || v.isEmpty ? 'Enter password' : null,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Text('Submit'),
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

