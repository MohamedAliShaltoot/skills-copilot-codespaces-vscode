import 'package:copilot_learning/core/app_constants.dart';
import 'package:copilot_learning/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const HomeScreen(),
    );
  }
}
