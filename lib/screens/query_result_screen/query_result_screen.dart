import 'dart:async';
import 'package:comparator/models/query_model.dart';
import 'package:comparator/models/query_result.dart';
import 'package:comparator/screens/query_result_screen/widgets/object_box.dart';
import 'package:comparator/screens/query_result_screen/widgets/results_box.dart';
import 'package:comparator/services/comparator_api.dart';
import 'package:comparator/widgets/com_box.dart';
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
    queryResult = sendQuery(queryModelState.objA, queryModelState.objB, queryModelState.aspects, queryModelState.quickSearch);
    queryModelState.resetModel();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
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
                      ResultBox(
                        dataCount: snapshot.data.results.dataCount,
                        objATendency: snapshot.data.results.objATendency,
                        objBTendency: snapshot.data.results.objBTendency,
                        elapsedTime: DateTime.fromMillisecondsSinceEpoch(_elapsedSeconds * 1000),
                      ),
                      ObjectBox(
                        objName: _objA,
                        tendency: snapshot.data.results.objATendency,
                        sentimentScore: snapshot.data.objASentimentScore,
                        emotionScores: snapshot.data.objAEmotions,
                        sentences: snapshot.data.results.objAData,
                      ),
                      ObjectBox(
                        objName: _objB,
                        tendency: snapshot.data.results.objBTendency,
                        sentimentScore: snapshot.data.objBSentimentScore,
                        emotionScores: snapshot.data.objBEmotions,
                        sentences: snapshot.data.results.objBData,
                      ),
                      //TODO: add AspectResultsComBox widget
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