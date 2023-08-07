import 'package:algoretailkobymashiach/data/fix_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('cartFillingArrayTitle should return correct title string', () {
    // Arrange
    FixString fixString = FixString();
    String inputString =
        '"מתוקים: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]';
    String expectedTitle = 'מתוקים';

    // Act
    String result = fixString.cartFillingArrayTitle(inputString);

    // Assert
    expect(result, equals(expectedTitle));
  });

  test('cartFillingArrayCount should return correct count', () {
    // Arrange
    FixString fixString = FixString();
    String inputString =
        '"מתוקים": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]';
    int expectedCount = 20;

    // Act
    int result = fixString.cartFillingArrayCount(inputString);

    // Assert
    expect(result, equals(expectedCount));
  });
}
