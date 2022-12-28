import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit()
      : super(const CalculatorState(
          pendingMathOperation: null,
          pendingNewInput: false,
          isAllClear: true,
          currentInput: "0",
          currentResult: "",
        ));

  void setInput(String input) {
    final currentState = state;
    if (currentState.isAllClear) {
      emit(state.copyWith(
        pendingNewInput: false,
        isAllClear: false,
        currentInput: input,
        currentResult: "",
      ));
    } else if (currentState.pendingNewInput) {
      emit(state.copyWith(
        pendingNewInput: false,
        isAllClear: false,
        currentInput: input,
      ));
    } else {
      var newInput = currentState.currentInput + input;
      if (newInput.length > 16) {
        newInput = newInput.replaceRange(16, newInput.length, '');
      }
      emit(state.copyWith(
        pendingNewInput: false,
        isAllClear: false,
        currentInput: newInput,
      ));
    }
  }

  void setCalculatorOperation(CalculatorInputs calculatorInput) {
    switch (calculatorInput) {
      case CalculatorInputs.changeSign:
        changeInputSign();
        break;
      case CalculatorInputs.result:
        setCurrentResult();
        break;
      case CalculatorInputs.clear:
        clearInput();
        break;
      case CalculatorInputs.percentage:
        setInputAsPercent();
        break;
      case CalculatorInputs.decimal:
        insertDecimal();
        break;
    }
  }

  void insertDecimal() {
    final currentState = state;

    var newInput = "${currentState.currentInput}.";
    if (newInput.length > 16) {
      newInput = newInput.replaceRange(16, newInput.length, '');
    }
    emit(state.copyWith(
      pendingNewInput: false,
      isAllClear: false,
      currentInput: newInput,
    ));
  }

  void setMathematicalOperation(MathematicalOperations operation) {
    if (state.pendingMathOperation != null) {
      if (state.pendingNewInput) {
        emit(state.copyWith(
          pendingNewInput: true,
          pendingMathOperation: operation,
          isAllClear: false,
        ));
      } else {
        num newResult = 0;
        final currentResult = num.parse(state.currentResult);
        final currentInput = num.parse(state.currentInput);
        switch (state.pendingMathOperation) {
          case MathematicalOperations.add:
            newResult = currentResult + currentInput;
            break;
          case MathematicalOperations.subtract:
            newResult = currentResult - currentInput;
            break;
          case MathematicalOperations.multiply:
            newResult = currentResult * currentInput;
            break;
          case MathematicalOperations.divide:
            newResult = currentResult / currentInput;
            break;
          case null:
            break;
        }
        if (newResult.isNaN || newResult.isInfinite) {
          emit(state.copyWith(
            pendingNewInput: true,
            pendingMathOperation: null,
            isAllClear: true,
            currentResult: "Shit doesn't add up",
          ));
        } else {
          emit(state.copyWith(
            pendingNewInput: true,
            pendingMathOperation: operation,
            isAllClear: false,
            currentResult: newResult.toString(),
          ));
        }
      }
    } else {
      emit(state.copyWith(
        pendingNewInput: true,
        pendingMathOperation: operation,
        isAllClear: false,
        currentResult: state.currentInput,
      ));
    }
  }

  void changeInputSign() {
    final currentState = state;
    final inputValue = num.parse(currentState.currentInput);
    emit(state.copyWith(
      currentInput:
          inputValue < 0 ? inputValue.abs().toString() : '-$inputValue',
    ));
  }

  void addDecimalToInput() {
    final currentState = state;
    emit(state.copyWith(
      currentInput: (num.parse(currentState.currentInput) / 100).toString(),
    ));
  }

  void setInputAsPercent() {
    final currentState = state;
    emit(state.copyWith(
      currentInput: (num.parse(currentState.currentInput) / 100).toString(),
    ));
  }

  void clearInput() {
    final currentState = state;

    if (currentState.pendingMathOperation != null &&
        currentState.pendingNewInput == false) {
      emit(state.copyWith(
        pendingNewInput: true,
        isAllClear: false,
        currentInput: "0",
      ));
    } else {
      emit(const CalculatorState(
        pendingNewInput: false,
        pendingMathOperation: null,
        isAllClear: true,
        currentInput: "0",
        currentResult: "",
      ));
    }
  }

  void setCurrentResult() {
    final currentState = state;
    num newResult = 0;

    if (currentState.pendingMathOperation != null) {
      final currentResult = num.parse(currentState.currentResult);
      final currentInput = num.parse(currentState.currentInput);
      switch (currentState.pendingMathOperation) {
        case MathematicalOperations.add:
          newResult = currentResult + currentInput;
          break;
        case MathematicalOperations.subtract:
          newResult = currentResult - currentInput;
          break;
        case MathematicalOperations.multiply:
          newResult = currentResult * currentInput;
          break;
        case MathematicalOperations.divide:
          newResult = currentResult / currentInput;
          break;
        case null:
          break;
      }
      if (newResult.isNaN || newResult.isInfinite) {
        emit(const CalculatorState(
          pendingNewInput: true,
          pendingMathOperation: null,
          isAllClear: true,
          currentInput: "Shit doesn't add up",
          currentResult: "",
        ));
      } else {
        emit(CalculatorState(
          pendingNewInput: true,
          pendingMathOperation: null,
          isAllClear: false,
          currentInput: newResult.toString(),
          currentResult: "",
        ));
      }
    } else {
      emit(state.copyWith(
        pendingMathOperation: null,
        isAllClear: false,
        currentResult: "",
      ));
    }
  }
}
