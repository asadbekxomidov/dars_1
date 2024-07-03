import 'package:dars_1/views/screens/appbar_screen.dart';
// import 'package:dars_1/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarScreen(),
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

