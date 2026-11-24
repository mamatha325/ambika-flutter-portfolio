import 'package:flutter/material.dart';
import 'package:ananya_portfolio/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('portfolio navigates between main sections', (tester) async {
    await tester.pumpWidget(const PortfolioApp(initialDarkMode: false));
    expect(find.text('Ambika'), findsOneWidget);

    await tester.tap(find.descendant(of: find.byType(NavigationBar), matching: find.text('Projects')));
    await tester.pumpAndSettle();
    expect(find.text('Selected work'.toUpperCase()), findsOneWidget);
    expect(find.text('EasyBuy'), findsOneWidget);
  });
}



