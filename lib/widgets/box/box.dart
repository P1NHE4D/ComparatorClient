import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Widget title;
  final Widget child;
  final Color backgroundColor;

  Box({this.title, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            SizedBox(height: 6),
            Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  child: child
                ))
          ],
        ));
  }
}