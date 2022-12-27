import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_cubit.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton(
    () => CalculatorCubit(),
  );
}
