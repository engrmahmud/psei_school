import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard'),
      actions: [
        IconButton(onPressed: () => context.go('/'), icon: const Icon(Icons.logout)),
      ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.go('/student-list');
            },
            child: Card(
              color: const Color.fromARGB(255, 185, 226, 255),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(16),
              child: Container(
                alignment: Alignment.center,
                height: 250,
                width: 300,
                padding: const EdgeInsets.all(16),
                child: Text('Manage students', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              
              ),
            ),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              context.go('/student-admission');
            },
            child: Card(
              color: const Color.fromARGB(255, 185, 226, 255),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(16),
              child: Container(
                alignment: Alignment.center,
                height: 250,
                width: 300,
                padding: const EdgeInsets.all(16),
                child: Text('Student Admission', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.go('/teacher-recruitment');
              },
              child: Card(
                color: const Color.fromARGB(255, 185, 226, 255),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Text('Teacher Recruitment', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.go('/teacher-list');
              },
              child: Card(
                color: const Color.fromARGB(255, 185, 226, 255),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Text('Teacher Management', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.go('/course-list');
              },
              child: Card(
                color: const Color.fromARGB(255, 185, 226, 255),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Text('Course Management', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                context.go('/course-admission');
              },
              child: Card(
                color: const Color.fromARGB(255, 185, 226, 255),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Text('Add Course', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          

          
          
             
             
             
             
             
             
             
             
             
             
             
       ],
      ),
    );
  }
}