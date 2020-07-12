import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ComProgressBar extends StatelessWidget {
  final Widget title;
  final Widget overlay;
  final BorderRadius cornerRadius;
  final EdgeInsets padding;
  final Color barColor;
  final Color backgroundColor;
  final double barHeight;

  final double value;

  String get valuePercentString => (value * 100.0).toStringAsFixed(1);

  ComProgressBar({
    this.title,
    this.overlay,
    this.cornerRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.padding = const EdgeInsets.all(0.0),
    this.barColor = const Color.fromARGB(0xff, 0x00, 0x00, 0x00),
    this.backgroundColor = const Color.fromARGB(0xff, 0x18, 0x18, 0x18),
    this.barHeight = 20.0,
    @required this.value,
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
          if (title != null) SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: cornerRadius, color: backgroundColor),
                      height: barHeight,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: (value * 100).round(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: cornerRadius, color: barColor),
                      height: barHeight,
                    ),
                  ),
                  Expanded(
                    flex: 100 - (value * 100).round(),
                    child: Container(
                      color: Colors.transparent,
                      height: barHeight,
                    ),
                  )
                ],
              ),
              if (overlay != null) overlay
            ],
          )
        ],
      ),
    );
  }
}
