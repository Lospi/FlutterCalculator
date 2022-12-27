import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/calculator_app.dart';
import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_observer.dart';
import 'package:flutter_calculator/setup.dart';

void main() {
  if (kDebugMode) {
    Bloc.observer = CalculatorObserver();
  }
  setup();
  runApp(const CalculatorApp());
}
