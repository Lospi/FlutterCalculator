import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_cubit.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';
import 'package:test/test.dart';

void main() {
  late CalculatorCubit calculatorCubit;

  setUp(() {
    calculatorCubit = CalculatorCubit();
  });

  test('Initial input is 0', () {
    expect(calculatorCubit.state.currentInput, '0');
  });

  blocTest(
    'Set Input as 1 when pressed',
    build: () => calculatorCubit,
    act: (bloc) => bloc.setInput("1"),
    expect: () => [
      const CalculatorState(
        currentResult: "",
        currentInput: "1",
        pendingMathOperation: null,
        pendingNewInput: false,
        isAllClear: false,
      )
    ],
  );

  blocTest(
    'Expect Add math operation after pressing +',
    build: () => calculatorCubit,
    act: (bloc) => bloc.setMathematicalOperation(MathematicalOperations.add),
    seed: () => const CalculatorState(
        pendingMathOperation: null,
        pendingNewInput: false,
        isAllClear: true,
        currentInput: "1",
        currentResult: ""),
    expect: () => [
      const CalculatorState(
        currentResult: "1",
        currentInput: "1",
        pendingMathOperation: MathematicalOperations.add,
        pendingNewInput: true,
        isAllClear: false,
      )
    ],
  );

  blocTest(
    'Change Input sign',
    build: () => calculatorCubit,
    act: (bloc) => bloc.changeInputSign(),
    seed: () => const CalculatorState(
      pendingMathOperation: null,
      pendingNewInput: false,
      isAllClear: true,
      currentInput: "1",
      currentResult: "",
    ),
    expect: () => [
      const CalculatorState(
        pendingMathOperation: null,
        pendingNewInput: false,
        isAllClear: true,
        currentInput: "-1",
        currentResult: "",
      )
    ],
  );
}
