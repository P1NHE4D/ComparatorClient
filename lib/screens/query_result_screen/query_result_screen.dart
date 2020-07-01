import 'package:comparator/models/query_model.dart';
import 'package:comparator/models/query_result.dart';
import 'package:comparator/services/comparator_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class QueryResultScreen extends StatefulWidget {
  @override
  _QueryResultScreenState createState() => _QueryResultScreenState();
}

class _QueryResultScreenState extends State<QueryResultScreen> {
  Future<QueryResult> queryResult;

  @override
  void initState() {
    super.initState();
    String objA = Provider.of<QueryModel>(context, listen: false).objA;
    String objB = Provider.of<QueryModel>(context, listen: false).objB;
    List<String> aspects = Provider.of<QueryModel>(context, listen: false).aspects;
    Provider.of<QueryModel>(context, listen: false).resetModel();
    queryResult = sendQuery(objA, objB, aspects);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}