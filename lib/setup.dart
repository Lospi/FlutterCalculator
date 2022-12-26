import 'package:flutter_calculator/widgets/current_result_cubit.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton(
    () => CurrentResultCubit(),
  );
}
