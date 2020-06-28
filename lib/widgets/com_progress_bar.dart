import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ComProgressBar extends StatelessWidget {
    final Widget title;
    final Color barColor;

    final double value;
    final double height;

    ComProgressBar({
        this.title,
        this.barColor = const Color.fromARGB(0xff, 0x00, 0x00, 0x00),
        this.value = 0.0,
        this.height = 20.0
    });

    @override
    Widget build(BuildContext context) {
        return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        title,
                        SizedBox(height: 8),
                        LinearPercentIndicator(
                            animation: true,
                            lineHeight: height,
                            animationDuration: 500,
                            percent: value,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: barColor,
                            backgroundColor: Color.fromARGB(0xff, 0x18, 0x18, 0x18),
                        )
                    ],
                ));
    }
}