import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ComTendencyBar extends StatelessWidget {
    final Widget title;
    final Color barColor;
    final Color textColor;
    final Color backgroundColor;

    final double leftValue;
    final double rightValue;
    final double height;

    double get leftRelative => leftValue / (leftValue + rightValue);

    double get rightRelative => rightValue / (leftValue + rightValue);

    String get leftPercentString => (leftRelative * 100.0).toStringAsFixed(1);

    String get rightPercentString => (rightRelative * 100.0).toStringAsFixed(1);

    double get leftAbs => max((leftRelative - 0.5) * 2.0, 0.0);

    double get rightAbs => max((rightRelative - 0.5) * 2.0, 0.0);

    String get leftAbsString => leftAbs.toStringAsFixed(1);

    String get rightAbsString => rightAbs.toStringAsFixed(1);

    ComTendencyBar({
        @required this.title,
        this.barColor = const Color.fromARGB(0xff, 0x00, 0x00, 0x00),
        this.textColor = const Color.fromARGB(0xff, 0xff, 0xff, 0xff),
        this.backgroundColor = const Color.fromARGB(0xff, 0x18, 0x18, 0x18),
        @required this.leftValue,
        @required this.rightValue,
        this.height = 20.0
    });

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                title,
                SizedBox(height: 8),
                Stack(
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Expanded(
                                        child:
                                        Transform.rotate(
                                            angle: pi,
                                            child: LinearPercentIndicator(
                                                animation: true,
                                                lineHeight: height,
                                                animationDuration: 500,
                                                percent: leftAbs,
                                                center: Transform.rotate(
                                                    angle: pi,
                                                    child: Text(
                                                            "$leftPercentString % - $leftAbsString",
                                                            style: TextStyle(color: textColor)),
                                                ),
                                                linearStrokeCap: LinearStrokeCap.roundAll,
                                                progressColor: barColor,
                                                backgroundColor: backgroundColor,
                                            ),
                                        )
                                ),
                                Expanded(
                                    child: LinearPercentIndicator(
                                        animation: true,
                                        lineHeight: height,
                                        animationDuration: 500,
                                        percent: rightAbs,
                                        center: new Text(
                                                "$rightPercentString % - $rightAbsString",
                                                style: TextStyle(color: textColor)),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: barColor,
                                        backgroundColor: backgroundColor,
                                    ),
                                )
                            ],
                        ),

                        Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Container(
                                            height: height,
                                            width: height / 2.0,
                                            color: Colors.transparent,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (leftAbs > 0.0) ? barColor : backgroundColor,),
                                                //  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                            )
                                    ),
                                    Container(
                                            height: height,
                                            width: height / 2.0,
                                            color: Colors.transparent,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (rightAbs > 0.0) ? barColor : backgroundColor,),
                                                //  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                            )
                                    ),
                                ],
                            ),

                        )
                    ],
                )
            ],
        );
    }
}