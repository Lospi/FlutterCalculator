import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_cubit.dart';
import 'package:flutter_calculator/calculator_page/widgets/keyboard_button.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 18,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 4,
          children: [
            BlocSelector<CalculatorCubit, CalculatorState, String>(
              selector: (state) => state.isAllClear ? "AC" : "C",
              builder: (context, text) => KeyboardButton(
                key: const Key("keyboard_button_clear"),
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
              key: Key("keyboard_button_plus_minus"),
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.plusMinus,
                color: Colors.white70,
              ),
              operation: OperationCalculator(
                  calculatorInput: CalculatorInputs.changeSign),
            ),
            const KeyboardButton(
              key: Key("keyboard_button_percent"),
              crossAxisSize: 1,
              buttonWidget: Icon(
                Icons.percent,
                color: Colors.white70,
              ),
              operation: OperationCalculator(
                  calculatorInput: CalculatorInputs.percentage),
            ),
            const KeyboardButton(
              key: Key("keyboard_button_divide"),
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.divide,
                color: Colors.white70,
              ),
              operation: OperationMathematics(
                  mathematicalOperation: MathematicalOperations.divide),
            ),
            const KeyboardButton(
                key: Key("keyboard_button_7"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.seven,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '7')),
            const KeyboardButton(
                key: Key("keyboard_button_8"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.eight,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '8')),
            const KeyboardButton(
                key: Key("keyboard_button_9"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.nine,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '9')),
            const KeyboardButton(
              key: Key("keyboard_button_multiply"),
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.white70,
              ),
              operation: OperationMathematics(
                  mathematicalOperation: MathematicalOperations.multiply),
            ),
            const KeyboardButton(
                key: Key("keyboard_button_4"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.four,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '4')),
            const KeyboardButton(
                key: Key("keyboard_button_5"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.five,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '5')),
            const KeyboardButton(
                key: Key("keyboard_button_6"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.six,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '6')),
            const KeyboardButton(
              key: Key("keyboard_button_minus"),
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.minus,
                color: Colors.white70,
              ),
              operation: OperationMathematics(
                  mathematicalOperation: MathematicalOperations.subtract),
            ),
            const KeyboardButton(
                key: Key("keyboard_button_1"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.one,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '1')),
            const KeyboardButton(
                key: Key("keyboard_button_2"),
                crossAxisSize: 1,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.two,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '2')),
            const KeyboardButton(
              key: Key("keyboard_button_3"),
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.three,
                color: Colors.white70,
              ),
              operation: OperationInput(input: '3'),
            ),
            const KeyboardButton(
              key: Key("keyboard_button_plus"),
              crossAxisSize: 1,
              buttonWidget: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.white70,
              ),
              operation: OperationMathematics(
                  mathematicalOperation: MathematicalOperations.add),
            ),
            const KeyboardButton(
                key: Key("keyboard_button_0"),
                crossAxisSize: 2,
                buttonWidget: FaIcon(
                  FontAwesomeIcons.zero,
                  color: Colors.white70,
                ),
                operation: OperationInput(input: '0')),
            KeyboardButton(
              key: const Key("keyboard_button_decimal"),
              crossAxisSize: 1,
              buttonWidget: Text(
                ".",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              operation: const OperationCalculator(
                  calculatorInput: CalculatorInputs.decimal),
            ),
            const KeyboardButton(
              key: Key("keyboard_button_equals"),
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
      ),
    );
  }
}
