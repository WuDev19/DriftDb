import 'package:drift_database/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 80),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Drift"),
          backgroundColor: Colors.lightGreen,
        ),
        body: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
