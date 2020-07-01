import 'package:comparator/models/emotion_scores.dart';
import 'package:comparator/models/query_model.dart';
import 'package:comparator/models/query_result.dart';
import 'package:comparator/services/comparator_api.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:comparator/widgets/com_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueryResultScreen extends StatefulWidget {
  @override
  _QueryResultScreenState createState() => _QueryResultScreenState();
}

class _QueryResultScreenState extends State<QueryResultScreen> {
  Future<QueryResult> queryResult;
  String _objA;
  String _objB;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final queryModelState = Provider.of<QueryModel>(context, listen: false);
    _objA = queryModelState.objA;
    _objB = queryModelState.objB;
    queryResult = sendQuery(queryModelState.objA, queryModelState.objB, queryModelState.aspects);
  }

  List<Widget> _buildProgressBars(double tendency, double sentimentScore, EmotionScores scores) {
    return [
      ComProgressBar(
        title: Text('Tendency', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: tendency < 0.5 ? Colors.red : tendency == 0.5 ? Colors.blueAccent : Colors.green,
        value: tendency,
      ),
      /*ComProgressBar(
        title: Text('Sentiment Score', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        barColor: sentimentScore < -0.05 ? Colors.red : tendency < 0.05 ? Colors.yellow : Colors.green,
        value: sentimentScore,
      ),*/
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
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComBox(
              title: Text(_objA, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
              backgroundColor: Color.fromRGBO(48, 48, 48, 1),
              child: FutureBuilder<QueryResult>(
                future: queryResult,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: _buildProgressBars(snapshot.data.results.objATendency, snapshot.data.objASentimentScore, snapshot.data.objAEmotions),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text(snapshot.error, style: TextStyle(color: Colors.red))
                      ],
                    );
                  }
                  return Column(
                    children: [
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    ],
                  );
                },
              ),
            ),
            ComBox(
              title: Text(_objB, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
              backgroundColor: Color.fromRGBO(48, 48, 48, 1),
              child: FutureBuilder<QueryResult>(
                future: queryResult,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: _buildProgressBars(snapshot.data.results.objBTendency, snapshot.data.objBSentimentScore, snapshot.data.objBEmotions),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text(snapshot.error, style: TextStyle(color: Colors.red))
                      ],
                    );
                  }
                  return Column(
                    children: [
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }

}