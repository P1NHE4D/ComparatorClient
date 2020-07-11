import 'dart:math';

import 'package:comparator/models/emotion_scores.dart';
import 'package:comparator/screens/sentence_list_screen/sentence_list_screen.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:comparator/widgets/com_progress_bar.dart';
import 'package:comparator/widgets/com_tendency_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ObjectBox extends StatelessWidget {
  final String objName;
  final double tendency;
  final double sentimentScore;
  final EmotionScores emotionScores;
  final List<String> sentences;

  ObjectBox({
    @required this.objName,
    @required this.tendency,
    @required this.sentimentScore,
    @required this.emotionScores,
    @required this.sentences
  });

  List<Widget> _buildProgressBars(double tendency, double sentimentScore, EmotionScores scores) {

    Widget buildProgressBar(String title, Color color, double value, bool isDense) {
      return ComProgressBar(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        title: Text(title, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        overlay: isDense ? null : Text((value ?? 0.0 * 100.0).toStringAsFixed(1) + '%', style: TextStyle(color: Colors.white),),
        barColor: color,
        value: value ?? 0.0,
        barHeight: isDense ? 10.0 : 20.0,
        cornerRadius: BorderRadius.all(Radius.circular(4.0)),
      );
    }

    final sentimentScoreNonNull = sentimentScore ?? 0.0;
    final r = 0xff - max(0, (sentimentScoreNonNull * 0xff).toInt());
    final g = 0xff - min(0, (sentimentScoreNonNull * 0xff).toInt());

    return [
      buildProgressBar('Popularity', tendency < 0.5 ? Colors.red : tendency == 0.5 ? Colors.blueAccent : Colors.green, tendency, false),
      ComTendencyBar(
        title: Text('Sentiment Score', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14),),
        value: sentimentScoreNonNull,
              barColor: Color.fromARGB(0xff, r, g, 0x0),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        subTitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text((sentimentScoreNonNull * 100).toStringAsFixed(1) + '%', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14),),
          ],
        )
      ),
      buildProgressBar('Anger', Color.fromARGB(0xff, 0x80, 0x0, 0x0), scores.anger, true),
      buildProgressBar('Disgust', Color.fromARGB(0xff, 0x60, 0x40, 0x0), scores.disgust, true),
      buildProgressBar('Fear', Color.fromARGB(0xff, 0x20, 0x0, 0xd0), scores.fear, true),
      buildProgressBar('Joy', Color.fromARGB(0xff, 0x05, 0x80, 0x0), scores.joy, true),
      buildProgressBar('Sadness', Color.fromARGB(0xff, 0x80, 0x0, 0xAE), scores.sadness, true)
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
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SentenceListScreen(sentences: sentences, title: objName,))),
    );
  }
}