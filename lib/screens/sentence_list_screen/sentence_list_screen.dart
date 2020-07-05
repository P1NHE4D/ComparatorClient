import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SentenceListScreen extends StatelessWidget {
  final List<String> sentences;
  final String title;

  SentenceListScreen({this.sentences, this.title});

  Widget _buildListItem(int index) {
    return ComBox(
      backgroundColor: Color.fromRGBO(48, 48, 48, 1),
      child: ListTile(
        title: Text(
          sentences[index],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemBuilder: (context, i) => _buildListItem(i),
        itemCount: sentences.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title, style: TextStyle(color: Colors.white),),
      ),
      body: _buildList(),
    );
  }

}