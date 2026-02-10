import 'package:flutter/material.dart';
import 'package:psei_school_client/psei_school_client.dart';
import 'package:psei_school_flutter/core/router/app_router.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late Client client;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter(client),
    );
  }
}
