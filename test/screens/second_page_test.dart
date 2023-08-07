import 'package:algoretailkobymashiach/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    '1. check correct text by id',
    (tester) async {
      int id = 1;
      await tester.pumpWidget(
        MaterialApp(
            home: TaskScreen(
          taskId: id.toString(),
        )),
      );
      var textWithId = find.text("מס' משימה ${id.toString()}");
      expect(textWithId, findsOneWidget);

      //check more numbers
      for (var i = id; i < 10; i++) {
        id++;
        await tester.pumpWidget(
          MaterialApp(
              home: TaskScreen(
            taskId: id.toString(),
          )),
        );
        textWithId = find.text("מס' משימה ${id.toString()}");
        expect(textWithId, findsOneWidget);
      }
    },
  );

  testWidgets(
    '2. check Appbar excists',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskScreen(taskId: '1'),
        ),
      );
      expect(find.byType(AppBar), findsOneWidget);
    },
  );
}
