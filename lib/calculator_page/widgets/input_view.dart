import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_cubit.dart';

class InputView extends StatelessWidget {
  const InputView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), //TODO verificar com 8 ou 4
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocBuilder<CalculatorCubit, CalculatorState>(
                buildWhen: (previous, current) =>
                    previous.currentResult != current.currentResult ||
                    previous.pendingMathOperation !=
                        current.pendingMathOperation,
                builder: (context, state) => Text(
                  textAlign: TextAlign.end,
                  "${state.currentResult} ${state.pendingMathOperation?.operator ?? ''}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const Divider(
                color: Colors.white10,
                thickness: 2,
              ),
              BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (context, state) {
                  return AutoSizeText(
                    textAlign: TextAlign.end,
                    state.currentInput,
                    maxLines: 1,
                    minFontSize: 16,
                    style: Theme.of(context).textTheme.bodyText2,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
