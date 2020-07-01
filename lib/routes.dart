import 'package:comparator/models/aspect_list_model.dart';
import 'package:comparator/screens/query_screen/query_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => ChangeNotifierProvider(
    create: (context) => AspectListModel(),
    child: QueryScreen(),
  )
};