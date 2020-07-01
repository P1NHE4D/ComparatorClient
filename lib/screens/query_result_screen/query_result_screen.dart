import 'package:comparator/models/query_model.dart';
import 'package:comparator/models/query_result.dart';
import 'package:comparator/services/comparator_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class QueryResultScreen extends StatefulWidget {
  @override
  _QueryResultScreenState createState() => _QueryResultScreenState();
}

class _QueryResultScreenState extends State<QueryResultScreen> {
  Future<QueryResult> queryResult;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final queryModelState = Provider.of<QueryModel>(context, listen: false);
    queryResult = sendQuery(queryModelState.objA, queryModelState.objB, queryModelState.aspects);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder<QueryResult>(
          future: queryResult,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                      snapshot.data.results.dataCount.toString()
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text(
                      snapshot.error.toString()
                  )
                ],
              );
            }
            return Column(
              children: [
                CircularProgressIndicator(),
              ],
            );
          }
      ),
    );
  }

}