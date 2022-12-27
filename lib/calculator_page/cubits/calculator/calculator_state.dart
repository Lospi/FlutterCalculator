part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {
  final String currentInput;
  final String currentResult;
  final bool isAllClear;
  final bool pendingNewInput;
  final MathematicalOperations? pendingMathOperation;

  const CalculatorState({
    required this.pendingNewInput,
    required this.pendingMathOperation,
    required this.isAllClear,
    required this.currentInput,
    required this.currentResult,
  });

  bool get isClear => currentResult.isEmpty && currentInput == '0';

  @override
  List<Object> get props => [
        currentInput,
        currentResult,
        isAllClear,
        pendingNewInput,
      ];

  CalculatorState copyWith({
    String? currentInput,
    String? currentResult,
    bool? isAllClear,
    bool? pendingNewInput,
    MathematicalOperations? pendingMathOperation,
  }) =>
      CalculatorState(
        pendingNewInput: pendingNewInput ?? this.pendingNewInput,
        pendingMathOperation: pendingMathOperation ?? this.pendingMathOperation,
        isAllClear: isAllClear ?? this.isAllClear,
        currentInput: currentInput ?? this.currentInput,
        currentResult: currentResult ?? this.currentResult,
      );
}
