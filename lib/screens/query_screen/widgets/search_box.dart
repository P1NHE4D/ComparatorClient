import 'package:comparator/models/query_model.dart';
import 'package:comparator/widgets/com_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController _objAcontroller = TextEditingController();
  final TextEditingController _objBcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _validateInput(String value) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 120,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Row(
          children: [
            Expanded(
              child: Consumer<QueryModel>(builder: (context, model, child) {
                _objAcontroller.text = model.objA.isEmpty ? null : model.objA;
                _objBcontroller.text = model.objB.isEmpty ? null : model.objB;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ComTextFormField(
                      label: 'Object A',
                      controller: _objAcontroller,
                      validator: _validateInput,
                    ),
                    ComTextFormField(
                      label: 'Object B',
                      controller: _objBcontroller,
                      validator: _validateInput,
                    ),
                  ],
                );
              }),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final model = Provider.of<QueryModel>(context, listen: false);
                  model.setObjects(_objAcontroller.text, _objBcontroller.text);
                  Navigator.pushNamed(context, '/results').then((val) {
                    if (model.autoReset) {
                      _objAcontroller.clear();
                      _objBcontroller.clear();
                    }
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
