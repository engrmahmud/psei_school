import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psei_school_client/psei_school_client.dart';

class StudentAdmissionPage extends StatefulWidget {
  final Client client;

  const StudentAdmissionPage({
    super.key, 
    required this.client
  });

  @override
  State<StudentAdmissionPage> createState() => _StudentAdmissionPageState();
}

class _StudentAdmissionPageState extends State<StudentAdmissionPage> {
  final formkey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController academicyear = TextEditingController();
  final TextEditingController studentname = TextEditingController();
  final TextEditingController bloodgroup = TextEditingController();
  final TextEditingController studentfathersname = TextEditingController();
  final TextEditingController studentmothersname = TextEditingController();
  final TextEditingController studentemail = TextEditingController();
  final TextEditingController studentphone = TextEditingController();
  final TextEditingController studentaddress = TextEditingController();
  final TextEditingController studentclass = TextEditingController();
  final TextEditingController studentsection = TextEditingController();
  final TextEditingController studentroll = TextEditingController();
  final TextEditingController studentregistration = TextEditingController();
  final TextEditingController studentpassword = TextEditingController();

  // Dropdown values
  String? _gender;
  String? _religion;
  String? _nationality;
  String? _bloodGroup;

  @override
  void initState() {
    super.initState();
    academicyear.text = DateTime.now().year.toString();
  }

  @override
  void dispose() {
    academicyear.dispose();
    studentname.dispose();
    bloodgroup.dispose();
    studentfathersname.dispose();
    studentmothersname.dispose();
    studentemail.dispose();
    studentphone.dispose();
    studentaddress.dispose();
    studentclass.dispose();
    studentsection.dispose();
    studentroll.dispose();
    studentregistration.dispose();
    studentpassword.dispose();
    super.dispose();
  }

  // Date pickers
  DateTime _admissionDate = DateTime.now();
  DateTime? _dob;

  Future<void> _pickDate(BuildContext context, bool isDob) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isDob ? DateTime(2005) : DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isDob) {
          _dob = picked;
        } else {
          _admissionDate = picked;
        }
      });
    }
  }

  Future<void> _save() async {
    if (formkey.currentState!.validate()) {
      final student = Student(
        academicYear: academicyear.text.trim(),
        admissionDate: _admissionDate,
        studentName: studentname.text.trim(),
        dateOfBirth: _dob ?? DateTime.now(),
        gender: _gender ?? '',
        religion: _religion ?? '',
        bloodGroup: bloodgroup.text.trim(),
        nationality: _nationality ?? '',
        fatherName: studentfathersname.text.trim(),
        motherName: studentmothersname.text.trim(),
        email: studentemail.text.trim(),
        phone: studentphone.text.trim(),
        address: studentaddress.text.trim(),
        studentClass: studentclass.text.trim(),
        section: studentsection.text.trim(),
        roll: studentroll.text.trim(),
        registration: studentregistration.text.trim(),
        password: studentpassword.text.trim(),
      );

      try {
        await widget.client.studentEndpoints.createStudent(student);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Student admitted successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(); // close dialog
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
            content: Text('Student already exists or failed: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(); // close dialog
                  context.go('/student-admission'); // stay on the same page
                },
                child: const Text('OK'),
             ) ,
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Responsive padding
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 600;

    return Scaffold(
      appBar: AppBar(title: 
       Column(
         children: [
          Center(child: 
           Text('Shukher Thikana PSEI School', style: Theme.of(context).textTheme.titleLarge)),
          
           Text('Admission Form', style: Theme.of(context).textTheme.titleMedium),
         ],
       ),  
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              // Academic Year + Class side by side
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: academicyear,
                      decoration: const InputDecoration(labelText: 'Academic Year'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter academic year' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: studentclass,
                      decoration: const InputDecoration(labelText: 'Class'),
                      validator: (v) => v == null || v.isEmpty ? 'Enter class' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Student Name
              TextFormField(
                controller: studentname,
                decoration: const InputDecoration(labelText: 'Student Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter student name' : null,
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

              // Admission date picker
              ListTile( 
                title: Text('Admission Date: ${_admissionDate.toLocal().toString().split(' ')[0]}'),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context, false),
                ),  
              ),

              // Date of birth picker
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

              // Other text fields
             
              TextFormField(
                controller: studentfathersname, 
                decoration: const InputDecoration(
                  labelText: 'Father\'s Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter father\'s name' : null,
              ),
              TextFormField(
                controller: studentmothersname, 
                decoration: const InputDecoration(
                  labelText: 'Mother\'s Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter mother\'s name' : null,
              ),
              TextFormField(
                controller: studentemail, 
                decoration: const InputDecoration(
                labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
              ),
              TextFormField(
                controller: studentphone, 
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (v) => v == null || v.isEmpty ? 'Enter phone number' : null,
              ),
              TextFormField(
                controller: studentaddress, 
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter address' : null,
              ),
              TextFormField(
                controller: studentsection, 
                decoration: const InputDecoration(labelText: 'Section'),
                validator: (v) => v == null || v.isEmpty ? 'Enter section' : null,
              ),
              TextFormField(
                controller: studentroll, 
                decoration: const InputDecoration(labelText: 'Roll'),
                validator: (v) => v == null || v.isEmpty ? 'Enter roll number' : null,
              ),
              TextFormField(
                controller: studentregistration, 
                decoration: const InputDecoration(labelText: 'Registration'),
                validator: (v) => v == null || v.isEmpty ? 'Enter registration number' : null,
              ),
              TextFormField(
                controller: studentpassword, 
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

// Example country list (expand with full ISO list if needed)
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






































































































