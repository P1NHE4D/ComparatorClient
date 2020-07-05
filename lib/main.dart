import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/query_model.dart';
import 'routes.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => QueryModel(), child: ComparatorApp()));
}

class ComparatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Comparator',
      initialRoute: '/',
      routes: routes,
    );
  }
}
