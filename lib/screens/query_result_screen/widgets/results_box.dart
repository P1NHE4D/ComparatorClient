import 'package:comparator/models/query_model.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultBox extends StatelessWidget {
  final int dataCount;
  final double objATendency;
  final double objBTendency;
  final DateTime elapsedTime;

  ResultBox({
    @required this.dataCount,
    @required this.objATendency,
    @required this.objBTendency,
    @required this.elapsedTime
  });

  Widget _buildTextRow(String title, String content, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 14)),
        Text(content, style: TextStyle(color: color, fontSize: 14))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryModelState = Provider.of<QueryModel>(context, listen: false);
    final String objA = queryModelState.objA;
    final String objB = queryModelState.objB;

    return ComBox(
        title: Text('Results', style: TextStyle(color: Color.fromRGBO(174, 174, 174, 1), fontSize: 18)),
        backgroundColor: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          children: [
            _buildTextRow('Processed data sets:', dataCount.toString(), Colors.yellowAccent),
            _buildTextRow('Elapsed time:', '${elapsedTime.minute}m ${elapsedTime.second < 10 ? '0${elapsedTime.second}' : elapsedTime.second}s', Colors.yellowAccent),
            _buildTextRow('Users prefer:', objATendency > objBTendency ? objA : objATendency < objBTendency ? objB : 'Draw', Colors.green),
            //TODO: display popularity of both objects
          ],
        )
    );
  }

}