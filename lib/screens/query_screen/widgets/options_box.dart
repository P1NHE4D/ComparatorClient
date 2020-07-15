import 'package:comparator/models/query_model.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsBox extends StatelessWidget {
  Widget _buildQuickSearchBtn(QueryModel model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quick Search',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Transform.scale(
            scale: 1.2,
            child: Switch(
              value: model.quickSearch,
              onChanged: (val) => model.quickSearch = val,
              activeColor: Colors.green,
            ),
          ),
        ],
      );

  Widget _buildResetBtn(QueryModel model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Auto Reset',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Transform.scale(
            scale: 1.2,
            child: Switch(
              value: model.autoReset,
              activeColor: Colors.green,
              onChanged: (val) => model.autoReset = val,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<QueryModel>(
      builder: (context, model, child) => ComBox(
        title: Text(
          'Options',
          style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18),
        ),
        child: Column(
          children: [
            _buildQuickSearchBtn(model),
            _buildResetBtn(model),
          ],
        ),
      ),
    );
  }
}
