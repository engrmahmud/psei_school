import 'package:flutter/material.dart';
import 'responsive.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      drawer: context.isDesktop
          ? null
          : Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(child: Text('Menu')),
                  ListTile(title: Text('Students')),
                  ListTile(title: Text('Teachers')),
                  ListTile(title: Text('Courses')),
                ],
              ),
            ),
      body: MaxWidth(
        child: body,
      ),
    );
  }
}
