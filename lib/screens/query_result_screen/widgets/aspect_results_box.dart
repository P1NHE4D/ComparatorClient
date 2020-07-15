import 'package:comparator/models/classified_data.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:comparator/widgets/com_tendency_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AspectResultsBox extends StatelessWidget {
  final Map<String, ClassifiedData> aspectResults;
  final String objA;
  final String objB;

  AspectResultsBox({
    @required this.aspectResults,
    @required this.objA,
    @required this.objB,
  });

  @override
  Widget build(BuildContext context) {
    return ComBox(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  objA,
                  style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18),
                ),
              ],
            ),
          ),
          Text(
            'vs',
            style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  objB,
                  style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      child: Column(
        children: aspectResults.entries.map((e) {
          double val = e.value.objATendency > e.value.objBTendency
              ? -e.value.objATendency + e.value.objBTendency
              : e.value.objBTendency - e.value.objATendency;
          return ComTendencyBar(
            barColor: Colors.lightBlue,
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            title: Text(
              e.key,
              style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14),
            ),
            value: val,
            subTitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (e.value.objATendency * 100).toStringAsFixed(1) + '%',
                  style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14),
                ),
                Text(
                  (e.value.objBTendency * 100).toStringAsFixed(1) + '%',
                  style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
