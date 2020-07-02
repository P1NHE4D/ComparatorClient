import 'dart:async';
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
  Timer _timer;
  int _elapsedSeconds = 0;
  int _secs = 0;
  int _minutes = 0;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final queryModelState = Provider.of<QueryModel>(context, listen: false);
    _objA = queryModelState.objA;
    _objB = queryModelState.objB;
    queryResult = sendQuery(queryModelState.objA, queryModelState.objB, queryModelState.aspects);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
        var time = DateTime.fromMillisecondsSinceEpoch(_elapsedSeconds * 1000);
        _minutes = time.minute;
        _secs = time.second;
      });
    });
  }

  Widget _buildErrorWidget(String errorMessage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ComBox(
          title: Text('An error occurred', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
          backgroundColor: Color.fromRGBO(48, 48, 48, 1),
          focusColor: Color.fromRGBO(56, 56, 56, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 16))
            ],
          ),
          icon: Icon(Icons.replay, color: Colors.white,),
          onTap: () => Navigator.pop(context),
        )
      ],
    );
  }

  Widget _buildTextRow(String title, String content, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        Text(content, style: TextStyle(color: color, fontSize: 14))
      ],
    );
  }

  Widget _buildResultsComBox(int dataCount, double objATendency, double objBTendency) {
    return ComBox(
      title: Text('Results', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
      backgroundColor: Color.fromRGBO(48, 48, 48, 1),
      child: Column(
        children: [
          _buildTextRow('Processed data sets:', dataCount.toString(), Colors.yellowAccent),
          _buildTextRow('Elapsed time:', '$_minutes m ${_secs < 10 ? '0$_secs' : _secs} s', Colors.yellowAccent),
          _buildTextRow('Users prefer:', objATendency > objBTendency ? _objA : objATendency < objBTendency ? _objB : 'Draw', Colors.green),
          //TODO: display popularity of both objects
        ],
      )
    );
  }

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

  Widget _buildObjectComBox(String objName, double tendency, double sentimentScore, EmotionScores emotionScores) {
    return ComBox(
      title: Text(objName, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
      backgroundColor: Color.fromRGBO(48, 48, 48, 1),
      child: Column(
        children: _buildProgressBars(tendency, sentimentScore, emotionScores),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        elevation: 0.0,
      ),
      body: FutureBuilder<QueryResult>(
        future: queryResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _timer.cancel();
            return SingleChildScrollView(
              child: Column(
                  children: [
                    _buildResultsComBox(snapshot.data.results.dataCount, snapshot.data.results.objATendency, snapshot.data.results.objBTendency),
                    _buildObjectComBox(_objA, snapshot.data.results.objATendency, snapshot.data.objASentimentScore, snapshot.data.objAEmotions),
                    _buildObjectComBox(_objB, snapshot.data.results.objBTendency, snapshot.data.objBSentimentScore, snapshot.data.objBEmotions)
                  ]
              ),
            );
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          }
          return Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    child: Text(
                        '${_minutes < 10 ? '0$_minutes' : _minutes}:${_secs < 10 ? '0$_secs' : _secs}',
                        style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                  )
                ]
            ),
          );
        },
      )
    );
  }
}