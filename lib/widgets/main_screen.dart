import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/widgets/current_result_cubit.dart';
import 'package:flutter_calculator/widgets/input_view.dart';
import 'package:flutter_calculator/widgets/keyboard.dart';
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
            create: (context) => GetIt.I.get<CurrentResultCubit>(),
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
      ),
    );
  }
}
