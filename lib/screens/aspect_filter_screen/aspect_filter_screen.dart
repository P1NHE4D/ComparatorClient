import 'package:comparator/models/query_model.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class AspectFilterScreen extends StatelessWidget {
  Widget _buildList(QueryModel model) {
    return Column(
      children: model.aspects.entries
          .map(
            (entry) => ListTile(
              title: Text(entry.key, style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: entry.value,
                onChanged: (val) => model.setAspectFilter(entry.key, val),
                activeColor: Colors.green,
              ),
            ),
          )
          .toList(),
    );
  }

    @override
    Widget build(BuildContext context) {
        //final model = Provider.of<QueryModel>(context, listen: false);
        return Scaffold(
            backgroundColor: Color.fromARGB(0xff, 0x0, 0x0, 0x0),
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Filter", style: TextStyle(color: Colors.white),),
            ),
            body: SingleChildScrollView(
                    child: Consumer<QueryModel>(
                            builder: (context, model, child) =>
                                    Column(
                                        children: [
                                            ComBox(
                                                    child: ListTile(
                                                        title: Text(
                                                            "Enable filter?",
                                                            style: TextStyle(color: Colors.white),),
                                                        trailing:
                                                        Switch(
                                                            value: model.enableFiltering,
                                                            onChanged: model.aspects.isEmpty
                                                                    ? null
                                                                    : (val) =>
                                                            model.enableFiltering = val,
                                                            activeColor: Colors.green,
                                                        ),
                                                    )
                                            ),
                                            if (model.aspects.isNotEmpty && model.enableFiltering) ComBox(
                                                    child: _buildList(model)
                                            )
                                        ],
                                    )
                    )
            ),
        );
    }
}