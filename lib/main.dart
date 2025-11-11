import 'package:clean_arch/config/di/di.dart';
import 'package:clean_arch/features/home/presentation/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
