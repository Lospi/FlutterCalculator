abstract class Operation {
  const Operation();
}

class OperationInput extends Operation {
  final String input;

  const OperationInput({required this.input});
}

enum CalculatorInputs {
  clear,
  changeSign,
  percentage,
  result,
  decimal,
}

class OperationCalculator extends Operation {
  final CalculatorInputs calculatorInput;

  const OperationCalculator({required this.calculatorInput});
}

enum MathematicalOperations {
  add('+'),
  subtract('-'),
  multiply('*'),
  divide('/');

  final String operator;

  const MathematicalOperations(this.operator);
}

class OperationMathematics extends Operation {
  final MathematicalOperations mathematicalOperation;

  const OperationMathematics({required this.mathematicalOperation});
}
