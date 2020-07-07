import 'package:comparator/models/classified_data.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:comparator/widgets/com_tendency_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AspectResultsBox extends StatelessWidget {
  final Map<String, ClassifiedData> aspectResults;

  AspectResultsBox({
    @required this.aspectResults
  });

  @override
  Widget build(BuildContext context) {
    return ComBox(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Aspects', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
        ],
      ),
      child: Column(
        children: aspectResults.entries.map((e) => ComTendencyBar(
          barColor: Colors.yellowAccent,
          textColor: Colors.white,
          padding: EdgeInsets.only(top: 5),
          title: Text(e.key, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
          value: e.value.objATendency > e.value.objBTendency ? -e.value.objATendency + e.value.objBTendency : e.value.objBTendency - e.value.objATendency,
          subTitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text((e.value.objATendency * 100).toStringAsFixed(1) + '%', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
              Text((e.value.objBTendency * 100).toStringAsFixed(1) + '%', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
            ],
          ),
        )).toList()
      ),
    );
  }

}