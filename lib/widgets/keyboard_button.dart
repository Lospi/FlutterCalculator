import 'package:flutter/material.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';
import 'package:flutter_calculator/widgets/calculator_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

class KeyboardButton extends StatelessWidget {
  final Widget buttonWidget;
  final Operation operation;
  final int crossAxisSize;

  const KeyboardButton({
    Key? key,
    this.crossAxisSize = 1,
    required this.buttonWidget,
    required this.operation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisSize,
      mainAxisCellCount: 1,
      child: Material(
        color: const Color.fromARGB(255, 20, 20, 20),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.black45,
          highlightColor: Colors.white10,
          onTap: () {
            final cubit = GetIt.I.get<CalculatorCubit>();
            final buttonOperation = operation;
            if (buttonOperation is OperationInput) {
              cubit.setInput(buttonOperation.input);
            } else if (buttonOperation is OperationCalculator) {
              cubit.setCalculatorOperation(buttonOperation.calculatorInput);
            } else if (buttonOperation is OperationMathematics) {
              cubit.setMathematicalOperation(
                  buttonOperation.mathematicalOperation);
            }
          },
          child: Center(child: buttonWidget),
        ),
      ),
    );
  }
}
