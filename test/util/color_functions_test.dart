import 'package:comparator/util/color_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Color should be red if the progress is 0%', (WidgetTester tester) async {
    Color c = Color.fromARGB(0xdd, 0xe6, 0x0, 0x0);

    final e = determineBarColor(0, 0, 100);
    expect(e, c);
  });

  testWidgets('Color should be red if the progress is lower than 0%', (WidgetTester tester) async {
    Color c = Color.fromARGB(0xdd, 0xe6, 0x0, 0x0);

    final e = determineBarColor(-1, 0, 100);
    expect(e, c);
  });

  testWidgets('Color should be yellow if progress is 50%', (WidgetTester tester) async {
    Color c = Color.fromARGB(0xdd, 0xe6, 0xe6, 0x0);

    final e = determineBarColor(50, 0, 100);
    expect(e, c);
  });

  testWidgets('Color should be green if progress is 100%', (WidgetTester tester) async {
    Color c = Color.fromARGB(0xdd, 0x0, 0xe6, 0x0);

    final e = determineBarColor(100, 0, 100);
    expect(e, c);
  });

  testWidgets('Color should be green if the progress is higher than 100%', (WidgetTester tester) async {
    Color c = Color.fromARGB(0xdd, 0x0, 0xe6, 0x0);

    final e = determineBarColor(101, 0, 100);
    expect(e, c);
  });
}