import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'com_progress_bar.dart';

class ComTendencyBar extends StatelessWidget {
    final Widget title;
    final Color barColor;
    final Color textColor;
    final Color backgroundColor;
    final EdgeInsets padding;
    final double spaceBetweenTitleAndBar;
    final double spaceBetweenBarAndPercent;

    final double leftValue;
    final double rightValue;
    final double barHeight;

    double get leftRelative => leftValue / (leftValue + rightValue);

    double get rightRelative => rightValue / (leftValue + rightValue);

    String get leftPercentString => (leftRelative * 100.0).toStringAsFixed(1);

    String get rightPercentString => (rightRelative * 100.0).toStringAsFixed(1);

    double get leftAbs => max((leftRelative - 0.5) * 2.0, 0.0);

    double get rightAbs => max((rightRelative - 0.5) * 2.0, 0.0);

    ComTendencyBar({
        this.title,
        this.barColor = const Color.fromARGB(0xff, 0x00, 0x00, 0x00),
        this.textColor = const Color.fromARGB(0xff, 0xff, 0xff, 0xff),
        this.backgroundColor = const Color.fromARGB(0xff, 0x18, 0x18, 0x18),
        this.padding = const EdgeInsets.all(0.0),
        this.spaceBetweenTitleAndBar = 4.0,
        this.spaceBetweenBarAndPercent = 4.0,
        @required this.leftValue,
        @required this.rightValue,
        this.barHeight = 20.0
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
                padding: padding,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        if (title != null) title,
                        if (title != null) SizedBox(height: spaceBetweenTitleAndBar),
                        Stack(
                            children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Expanded(
                                                child: Transform.rotate(
                                                    angle: pi,
                                                    child: ComProgressBar(
                                                        barHeight: barHeight,
                                                        value: leftAbs,
                                                        showText: false,
                                                        barColor: barColor,
                                                        backgroundColor: backgroundColor,
                                                        cornerRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(0),
                                                                bottomLeft: Radius.circular(0),
                                                                topRight: Radius.circular(10),
                                                                bottomRight: Radius.circular(10)
                                                        ),
                                                    ),
                                                )
                                        ),
                                        Expanded(
                                            child: ComProgressBar(
                                                barHeight: barHeight,
                                                value: rightAbs,
                                                showText: false,
                                                barColor: barColor,
                                                backgroundColor: backgroundColor,
                                                cornerRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(0),
                                                        bottomLeft: Radius.circular(0),
                                                        topRight: Radius.circular(10),
                                                        bottomRight: Radius.circular(10)
                                                ),
                                            ),
                                        )
                                    ],
                                ),
                            ],
                        ),
                        SizedBox(height: spaceBetweenBarAndPercent),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text("$leftPercentString %"),
                                Text("$rightPercentString %")
                            ],
                        )
                    ],
                )
        );
    }
}