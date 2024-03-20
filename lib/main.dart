import 'package:flutter/material.dart';
import 'package:umuttepe_turizm/home_page.dart';
import 'package:umuttepe_turizm/login.dart';
import 'package:umuttepe_turizm/pnrYazd%C4%B1r%C4%B1c%C4%B1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Umuttepe Turizm ',
      home: HomePage(),
    );
  }
}
