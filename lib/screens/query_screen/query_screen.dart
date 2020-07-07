import 'package:comparator/screens/query_screen/widgets/aspect_box.dart';
import 'package:comparator/screens/query_screen/widgets/options_box.dart';
import 'package:comparator/screens/query_screen/widgets/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QueryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBox(),
            OptionsBox(),
            AspectBox(),
          ],
        ),
      )
    );
  }
}