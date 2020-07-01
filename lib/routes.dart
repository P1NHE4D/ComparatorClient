import 'package:comparator/models/query_model.dart';
import 'package:comparator/screens/query_result_screen/query_result_screen.dart';
import 'package:comparator/screens/query_screen/query_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => ChangeNotifierProvider(
    create: (context) => QueryModel(),
    child: QueryScreen(),
  ),
  '/results': (BuildContext context) => QueryResultScreen()
};