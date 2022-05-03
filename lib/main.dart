import 'package:flutter/material.dart';
import 'package:thaimed/src/admin.dart';
import 'package:thaimed/src/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Admin.route: (context) => const Admin(),
      },
      title: 'Thaimed',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
