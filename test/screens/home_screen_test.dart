import 'package:algoretailkobymashiach/screens/home_screen.dart';
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

  // testWidgets(
  //   '3. check if clicked on screen go to second page with id "1"',
  //   (tester) async {
  //     await tester.pumpWidget(
  //       const MaterialApp(
  //         home: HomeScreen(),
  //       ),
  //     );
  //     final pageClicked = find.byKey(const Key('all_screen_tap'));
  //     await tester.tap(pageClicked);
  //     await tester.pump();

  //     final mission1 = find.text("מס' משימה");
  //     expect(mission1, findsOneWidget);
  //   },
  // );
}
