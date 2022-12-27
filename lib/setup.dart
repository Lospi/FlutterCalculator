import 'package:flutter_calculator/widgets/calculator_cubit.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton(
    () => CalculatorCubit(),
  );
}
