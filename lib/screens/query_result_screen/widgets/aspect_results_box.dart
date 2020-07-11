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
        children: aspectResults.entries.map((e) {
          double val = 0.0;
          if (e.value.objATendency != null && e.value.objBTendency != null) {
            val = e.value.objATendency > e.value.objBTendency ? -e.value.objATendency + e.value.objBTendency : e.value.objBTendency - e.value.objATendency;
          }
          return ComTendencyBar(
              barColor: Colors.lightBlue,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              title: Text(e.key, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
              value: val,
              subTitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((e.value.objATendency ?? 0 * 100).toStringAsFixed(1) + '%', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
                    Text((e.value.objBTendency ?? 0 * 100).toStringAsFixed(1) + '%', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
                  ],
                ),
              );
          }
        ).toList(),
      ),
    );
  }

}