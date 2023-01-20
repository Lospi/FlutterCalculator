import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_cubit.dart';
import 'package:flutter_calculator/calculator_page/widgets/input_view.dart';
import 'package:flutter_calculator/calculator_page/widgets/keyboard.dart';
import 'package:get_it/get_it.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: BlocProvider(
            create: (context) => GetIt.I.get<CalculatorCubit>(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                InputView(),
                Expanded(child: Keyboard()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
