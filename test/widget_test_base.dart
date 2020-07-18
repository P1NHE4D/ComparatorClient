import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTestBase extends StatelessWidget {
  final Widget testWidget;

  WidgetTestBase({this.testWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: testWidget,
      ),
    );
  }
}