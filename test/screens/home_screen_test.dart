import 'package:algoretailkobymashiach/screens/home_screen.dart';
import 'package:algoretailkobymashiach/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    '1. check search bar start with empty contoller, need to display "חיפוש"',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );
      final search = find.text("חיפוש");
      expect(search, findsOneWidget);
    },
  );

  testWidgets(
    '2. check all widgets excists',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );
      expect(find.byType(AppBar), findsOneWidget); // check app bar exist
      expect(find.byType(Scaffold), findsOneWidget); // check Scaffold exist
      expect(find.byType(Container),
          findsWidgets); // check one container or more exists
    },
  );

  testWidgets(
    '3. check search icon exist',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );
      expect(find.byIcon(Icons.search), findsOneWidget);
    },
  );
}
