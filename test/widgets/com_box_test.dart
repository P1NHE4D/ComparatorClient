import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_test_base.dart';

void main() {
  testWidgets('ComBox has a title', (WidgetTester tester) async {
    String text = 'Test';
    Text t = Text(text);
    WidgetTestBase w = WidgetTestBase(
      testWidget: ComBox(title: t,),
    );
    await tester.pumpWidget(w);

    final titleFinder = find.byWidget(t);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Should set the background color of ComBox', (WidgetTester tester) async {
    Color c = Colors.red;
    ComBox comBox = ComBox(backgroundColor: c,);
    WidgetTestBase w = WidgetTestBase(
      testWidget: comBox
    );
    await tester.pumpWidget(w);

    final box = tester.firstWidget(find.byType(ComBox));
    expect((box as ComBox).backgroundColor, c);

  });
}