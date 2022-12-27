import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_page/widgets/main_screen.dart';

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
          bodyText2: TextStyle(fontSize: 48, color: Colors.white70),
        ),
      ),
      home: const Calculator(),
    );
  }
}
