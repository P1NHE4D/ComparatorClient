import 'package:comparator/models/emotion_scores.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:comparator/widgets/com_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ObjectComBox extends StatelessWidget {
  final String objName;
  final double tendency;
  final double sentimentScore;
  final EmotionScores emotionScores;

  ObjectComBox({
    @required this.objName,
    @required this.tendency,
    @required this.sentimentScore,
    @required this.emotionScores
  });

  List<Widget> _buildProgressBars(double tendency, double sentimentScore, EmotionScores scores) {
    Widget buildProgressBar(String title, Color color, double value) {
      return ComProgressBar(
        title: Text(title, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: color,
        value: value,
      );
    }

    return [
      buildProgressBar('Popularity', tendency < 0.5 ? Colors.red : tendency == 0.5 ? Colors.blueAccent : Colors.green, tendency),
      buildProgressBar('Anger', Colors.indigo, scores.anger),
      buildProgressBar('Disgust', Colors.indigo, scores.disgust),
      buildProgressBar('Fear', Colors.indigo, scores.fear),
      buildProgressBar('Joy', Colors.indigo, scores.joy),
      buildProgressBar('Sadness', Colors.indigo, scores.sadness)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ComBox(
      title: Text(objName, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
      backgroundColor: Color.fromRGBO(48, 48, 48, 1),
      child: Column(
        children: _buildProgressBars(tendency, sentimentScore, emotionScores),
      ),
    );
  }
}