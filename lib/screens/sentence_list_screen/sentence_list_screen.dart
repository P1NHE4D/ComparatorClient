import 'package:comparator/models/query_model.dart';
import 'package:comparator/screens/aspect_filter_screen/aspect_filter_screen.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SentenceListScreen extends StatelessWidget {
  final List<String> sentences;
  final String title;

  SentenceListScreen({this.sentences, this.title});

  Widget _buildListItem(int index, List<String> sentences) => ComBox(
        backgroundColor: Color.fromRGBO(48, 48, 48, 1),
        child: ListTile(
          title: Text(
            sentences[index],
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _buildListInner(List<String> sentences) => ListView.builder(
      itemBuilder: (context, i) => _buildListItem(i, sentences), itemCount: sentences.length);

  Widget _buildList() => Consumer<QueryModel>(
        builder: (context, model, child) {
          if (!model.enableFilter) return _buildListInner(sentences);

          var aspectsLower = model.aspects.entries
              .where((e) => e.value)
              .map((e) => e.key)
              .map((aspect) => aspect.toLowerCase())
              .toList();

          bool filter(str) => aspectsLower.any((a) => str.toLowerCase().contains(a));

          var filteredSentences = sentences.where(filter).toList();

          return _buildListInner(filteredSentences);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AspectFilterScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _buildList(),
    );
  }
}
