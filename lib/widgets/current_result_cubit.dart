import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';

part 'current_result_state.dart';

class CurrentResultCubit extends Cubit<CurrentResultLoaded> {
  CurrentResultCubit()
      : super(const CurrentResultLoaded(
          pendingMathOperation: null,
          pendingNewInput: false,
          isAllClear: true,
          currentInput: "0",
          currentResult: "",
        ));

  void setInput(String input) {
    final currentState = state;
    if (currentState.isAllClear) {
      emit(CurrentResultLoaded(
        pendingNewInput: false,
        pendingMathOperation: currentState.pendingMathOperation,
        isAllClear: false,
        currentInput: input,
        currentResult: "",
      ));
    } else if (currentState.pendingNewInput) {
      emit(CurrentResultLoaded(
        pendingNewInput: false,
        pendingMathOperation: currentState.pendingMathOperation,
        isAllClear: false,
        currentInput: input,
        currentResult: currentState.currentResult,
      ));
    } else {
      var newInput = currentState.currentInput + input;
      if (newInput.length > 16) {
        newInput = newInput.replaceRange(16, newInput.length, '');
      }
      emit(CurrentResultLoaded(
        pendingNewInput: false,
        pendingMathOperation: currentState.pendingMathOperation,
        isAllClear: false,
        currentInput: newInput,
        currentResult: currentState.currentResult,
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
    emit(CurrentResultLoaded(
      pendingNewInput: false,
      pendingMathOperation: currentState.pendingMathOperation,
      isAllClear: false,
      currentInput: newInput,
      currentResult: currentState.currentResult,
    ));
  }

  void setMathematicalOperation(MathematicalOperations operation) {
    if (state.pendingMathOperation != null) {
      if (state.pendingNewInput) {
        emit(CurrentResultLoaded(
          pendingNewInput: true,
          pendingMathOperation: operation,
          isAllClear: false,
          currentInput: state.currentInput,
          currentResult: state.currentInput,
        ));
      } else {
        num newResult = 0;
        final currentResult = num.parse(state.currentResult);
        switch (state.pendingMathOperation) {
          case MathematicalOperations.add:
            newResult = currentResult + num.parse(state.currentInput);
            break;
          case MathematicalOperations.subtract:
            newResult = currentResult - num.parse(state.currentInput);
            break;
          case MathematicalOperations.multiply:
            newResult = currentResult * num.parse(state.currentInput);
            break;
          case MathematicalOperations.divide:
            newResult = currentResult / num.parse(state.currentInput);
            break;
          case null:
            break;
        }
        emit(CurrentResultLoaded(
          pendingNewInput: true,
          pendingMathOperation: operation,
          isAllClear: false,
          currentInput: state.currentInput,
          currentResult: newResult.toString(),
        ));
      }
    } else {
      emit(CurrentResultLoaded(
        pendingNewInput: true,
        pendingMathOperation: operation,
        isAllClear: false,
        currentInput: state.currentInput,
        currentResult: state.currentInput,
      ));
    }
  }

  void changeInputSign() {
    final currentState = state;
    final inputValue = num.parse(currentState.currentInput);
    emit(CurrentResultLoaded(
      pendingNewInput: currentState.pendingNewInput,
      pendingMathOperation: currentState.pendingMathOperation,
      isAllClear: false,
      currentInput:
          inputValue < 0 ? inputValue.abs().toString() : '-$inputValue',
      currentResult: currentState.currentResult,
    ));
  }

  void addDecimalToInput() {
    final currentState = state;
    emit(CurrentResultLoaded(
      pendingNewInput: currentState.pendingNewInput,
      pendingMathOperation: currentState.pendingMathOperation,
      isAllClear: false,
      currentInput: (num.parse(currentState.currentInput) / 100).toString(),
      currentResult: currentState.currentResult,
    ));
  }

  void setInputAsPercent() {
    final currentState = state;
    emit(CurrentResultLoaded(
      pendingNewInput: currentState.pendingNewInput,
      pendingMathOperation: currentState.pendingMathOperation,
      isAllClear: false,
      currentInput: (num.parse(currentState.currentInput) / 100).toString(),
      currentResult: currentState.currentResult,
    ));
  }

  void clearInput() {
    final currentState = state;

    if (currentState.pendingMathOperation != null &&
        currentState.pendingNewInput == false) {
      emit(CurrentResultLoaded(
        pendingNewInput: true,
        pendingMathOperation: currentState.pendingMathOperation,
        isAllClear: false,
        currentInput: "0",
        currentResult: currentState.currentResult,
      ));
    } else {
      emit(const CurrentResultLoaded(
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
      switch (currentState.pendingMathOperation) {
        case MathematicalOperations.add:
          newResult = num.parse(currentState.currentResult) +
              num.parse(currentState.currentInput);
          break;
        case MathematicalOperations.subtract:
          newResult = num.parse(currentState.currentResult) -
              num.parse(currentState.currentInput);
          break;
        case MathematicalOperations.multiply:
          newResult = num.parse(currentState.currentResult) *
              num.parse(currentState.currentInput);
          break;
        case MathematicalOperations.divide:
          newResult = num.parse(currentState.currentResult) /
              num.parse(currentState.currentInput);
          break;
        case null:
          break;
      }
      emit(CurrentResultLoaded(
        pendingNewInput: true,
        pendingMathOperation: null,
        isAllClear: false,
        currentInput: newResult.toString(),
        currentResult: "",
      ));
    } else {
      emit(CurrentResultLoaded(
        pendingNewInput: currentState.pendingNewInput,
        pendingMathOperation: null,
        isAllClear: false,
        currentInput: currentState.currentInput,
        currentResult: "",
      ));
    }
  }
}
