import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';
import 'package:flutter_calculator/widgets/current_result_cubit.dart';
import 'package:flutter_calculator/widgets/keyboard_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 4,
        children: [
          BlocSelector<CurrentResultCubit, CurrentResultLoaded, String>(
            selector: (state) => state.isAllClear ? "AC" : "C",
            builder: (context, text) => KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              operation: const OperationCalculator(
                calculatorInput: CalculatorInputs.clear,
              ),
            ),
          ),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.plusMinus,
              color: Colors.white70,
            ),
            operation: OperationCalculator(
                calculatorInput: CalculatorInputs.changeSign),
          ),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: Icon(
              Icons.percent,
              color: Colors.white70,
            ),
            operation: OperationCalculator(
                calculatorInput: CalculatorInputs.percentage),
          ),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.divide,
              color: Colors.white70,
            ),
            operation: OperationMathematics(
                mathematicalOperation: MathematicalOperations.divide),
          ),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.seven,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '7')),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.eight,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '8')),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.nine,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '9')),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.xmark,
              color: Colors.white70,
            ),
            operation: OperationMathematics(
                mathematicalOperation: MathematicalOperations.multiply),
          ),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.four,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '4')),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.five,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '5')),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.six,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '6')),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.minus,
              color: Colors.white70,
            ),
            operation: OperationMathematics(
                mathematicalOperation: MathematicalOperations.subtract),
          ),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.one,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '1')),
          const KeyboardButton(
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.two,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '2')),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.three,
              color: Colors.white70,
            ),
            operation: OperationInput(input: '3'),
          ),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white70,
            ),
            operation: OperationMathematics(
                mathematicalOperation: MathematicalOperations.add),
          ),
          const KeyboardButton(
              crossAxisSize: 2,
              buttonWidget: FaIcon(
                FontAwesomeIcons.zero,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '0')),
          KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: Text(
              ".",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            operation: const OperationCalculator(
                calculatorInput: CalculatorInputs.decimal),
          ),
          const KeyboardButton(
            crossAxisSize: 1,
            buttonWidget: FaIcon(
              FontAwesomeIcons.equals,
              color: Colors.white70,
            ),
            operation:
                OperationCalculator(calculatorInput: CalculatorInputs.result),
          ),
        ],
      ),
    );
  }
}
