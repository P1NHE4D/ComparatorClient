import 'package:comparator/models/query_model.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComBox(
      title: Text('Options',
          style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quick Search',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Consumer<QueryModel>(
            builder: (context, model, child) => Transform.scale(
              scale: 1.2,
              child: Switch(
                value: model.quickSearch,
                onChanged: (val) => model.quickSearch = val,
                activeColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
