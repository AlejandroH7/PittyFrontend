import 'package:flutter/material.dart';
import 'package:pitty_frontend/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pitty',
      routerConfig: appRouter,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
