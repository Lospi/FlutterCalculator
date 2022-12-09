import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculator.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 24, color: Colors.white70),
        ),
      ),
      home: const Calculator(),
    );
  }
}
