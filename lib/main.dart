import 'package:flutter/material.dart';
import 'package:umuttepe_turizm/home_page.dart';
import 'package:umuttepe_turizm/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Umuttepe Turizm ',
      home: LoginPage(),
    );
  }
}
