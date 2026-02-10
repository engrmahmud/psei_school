import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';

class TeacherRecruitmentPage extends StatefulWidget {
  final Client client;

  const TeacherRecruitmentPage({
    super.key, 
    required this.client
  });

  @override
  State<TeacherRecruitmentPage> createState() => _TeacherRecruitmentPageState();
}

class _TeacherRecruitmentPageState extends State<TeacherRecruitmentPage> {
  final formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final teacherName = TextEditingController();
  final department = TextEditingController();
  final designation = TextEditingController();
  final qualification = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final permanentAddress = TextEditingController();
  final registration = TextEditingController();
  final password = TextEditingController();
  final experience = TextEditingController();
  final salary = TextEditingController();
  final profileImage = TextEditingController();

  // Dropdowns
  String? _gender;
  String? _religion;
  String? _bloodGroup;
  String? _nationality;
  String? _maritalStatus;

  // Date pickers
  DateTime _joiningDate = DateTime.now();
  DateTime? _dob;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    teacherName.dispose();
    department.dispose();
    designation.dispose();
    qualification.dispose();
    fatherName.dispose();
    motherName.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    permanentAddress.dispose();
    registration.dispose();
    password.dispose();
    experience.dispose();
    salary.dispose();
    profileImage.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context, bool isDob) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isDob ? DateTime(1985) : DateTime.now(),
      firstDate: DateTime(1950),
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
    if (formKey.currentState!.validate()) {
      final teacher = Teacher(
        teacherName: teacherName.text.trim(),
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
        experience: int.tryParse(experience.text) ?? 0,
        profileImage: profileImage.text.trim().isEmpty ? null : profileImage.text.trim(),
        maritalStatus: _maritalStatus ?? '',
        salary: double.tryParse(salary.text) ?? 0.0,
      );

      try {
        await widget.client.teacherEndpoints.createTeacher(teacher);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Teacher recruited successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.go('/');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: Text('Recruitment failed: $e'),
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
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Center(
              child: Text('Shukher Thikana PSEI School',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Text('Teacher Recruitment Form',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // Name + Department
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: teacherName,
                      decoration: const InputDecoration(labelText: 'Teacher Name'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: department,
                      decoration: const InputDecoration(labelText: 'Department'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter department' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Designation + Qualification
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: designation,
                      decoration: const InputDecoration(labelText: 'Designation'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter designation' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: qualification,
                      decoration: const InputDecoration(labelText: 'Qualification'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter qualification' : null,
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

              // Nationality dropdown
              DropdownButtonFormField<String>(
                value: _nationality,
                items: _countryList.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (val) => setState(() => _nationality = val),
                decoration: const InputDecoration(labelText: 'Nationality'),
                validator: (value) => value == null ? 'Select nationality' : null,
              ),
              const SizedBox(height: 16),

              // Joining date picker
              ListTile(
                title: Text('Joining Date: ${_joiningDate.toLocal().toString().split(' ')[0]}'),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context, false),
                ),
              ),

              // Date of birth picker
              ListTile(
                title: Text('Date of Birth: ${_dob != null ? _dob!.toLocal().toString().split(' ')[0] : 'Select date of birth'}'),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context, true),
                ),
              ),

              const SizedBox(height: 16),

              // Other text fields  
              TextFormField(
                controller: fatherName,
                decoration: const InputDecoration(labelText: 'Father\'s Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter father\'s name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: motherName,
                decoration: const InputDecoration(labelText: 'Mother\'s Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter mother\'s name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 16), 
              TextFormField(
                controller: phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (v) => v == null || v.isEmpty ? 'Enter phone' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: address,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter address' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: permanentAddress,
                decoration: const InputDecoration(labelText: 'Permanent Address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter permanent address' : null,    
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: registration,
                decoration: const InputDecoration(labelText: 'Registration'),
                validator: (v) => v == null || v.isEmpty ? 'Enter registration' : null,
              ),  
              const SizedBox(height: 16),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (v) => v == null || v.isEmpty ? 'Enter password' : null,
                obscureText: true,
              ),  
              const SizedBox(height: 16),
              TextFormField(
                controller: experience,
                decoration: const InputDecoration(labelText: 'Experience'),
                validator: (v) => v == null || v.isEmpty ? 'Enter experience' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: salary,
                decoration: const InputDecoration(labelText: 'Salary'),
                validator: (v) => v == null || v.isEmpty ? 'Enter salary' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: profileImage,
                decoration: const InputDecoration(labelText: 'Profile Image URL (optional)'),
              ),
              const SizedBox(height: 16),
              // Marital status dropdown
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

              // Submit button
              ElevatedButton(
                onPressed: () => _save(),
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











