import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/input_view.dart';
import 'package:flutter_calculator/widgets/keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              InputView(),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
