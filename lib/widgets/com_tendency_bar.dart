import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'com_progress_bar.dart';

class ComTendencyBar extends StatelessWidget {
    final Widget title;
    final Widget leftSlot;
    final Widget rightSlot;
    final EdgeInsets padding;
    final Color barColor;
    final Color textColor;
    final Color backgroundColor;
    final double spaceBetweenTitleAndBar;
    final double spaceBetweenBarAndPercent;
    final double barHeight;

    final double value;

    double get leftAbs => max(-value, 0.0);

    double get rightAbs => max(value, 0.0);

    ComTendencyBar({
        this.title,
        this.leftSlot,
        this.rightSlot,
        this.padding = const EdgeInsets.all(0.0),
        this.barColor = const Color.fromARGB(0xff, 0x00, 0x00, 0x00),
        this.textColor = const Color.fromARGB(0xff, 0xff, 0xff, 0xff),
        this.backgroundColor = const Color.fromARGB(0xff, 0x18, 0x18, 0x18),
        this.spaceBetweenTitleAndBar = 4.0,
        this.spaceBetweenBarAndPercent = 4.0,
        this.barHeight = 20.0,
        this.value = 0.0,
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
                                leftSlot,
                                rightSlot
                            ],
                        )
                    ],
                )
        );
    }
}