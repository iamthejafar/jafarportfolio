import 'package:flutter/material.dart';
import 'package:jafarportfolio/core/theme/app_theme.dart';
import 'package:jafarportfolio/features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
