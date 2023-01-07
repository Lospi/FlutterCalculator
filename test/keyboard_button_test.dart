import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_page/cubits/calculator/calculator_cubit.dart';
import 'package:flutter_calculator/calculator_page/widgets/keyboard_button.dart';
import 'package:flutter_calculator/domain/entities/operation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';

class CalculatorCubitMock extends MockCubit<CalculatorState>
    implements CalculatorCubit {}

void main() {
  testWidgets('Test calculator number input', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: StaggeredGrid.count(
        crossAxisCount: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: const [
          KeyboardButton(
            buttonWidget: Text("1"),
            operation: OperationInput(input: "1"),
            crossAxisSize: 1,
          ),
        ],
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);

    await expectLater(
      find.byType(KeyboardButton),
      matchesGoldenFile('KeyboardButton.png'),
    );
  });
}
