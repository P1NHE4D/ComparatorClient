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
    return [
      ComProgressBar(
        title: Text('Popularity', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: tendency < 0.5 ? Colors.red : tendency == 0.5 ? Colors.blueAccent : Colors.green,
        value: tendency,
      ),
      //TODO: add tendency bar for sentiment scores
      ComProgressBar(
        title: Text('Anger', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: Colors.indigo,
        value: scores.anger,
      ),
      ComProgressBar(
        title: Text('Disgust', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: Colors.indigo,
        value: scores.disgust,
      ),
      ComProgressBar(
        title: Text('Fear', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: Colors.indigo,
        value: scores.fear,
      ),
      ComProgressBar(
        title: Text('Joy', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: Colors.indigo,
        value: scores.joy,
      ),
      ComProgressBar(
        title: Text('Sadness', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: Colors.indigo,
        value: scores.sadness,
      ),
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