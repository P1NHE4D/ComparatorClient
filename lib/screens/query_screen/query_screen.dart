import 'package:comparator/models/aspect_list_model.dart';
import 'package:comparator/screens/query_screen/widgets/aspect_selector.dart';
import 'package:comparator/services/comparator_api.dart';
import 'package:comparator/widgets/com_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueryScreen extends StatelessWidget {
  final TextEditingController _objAcontroller = TextEditingController();
  final TextEditingController _objBcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp _regExp = new RegExp(r"^\w+$");

  String _validateInput(String value) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    if (!_regExp.hasMatch(value)) {
      return 'Only alphanumeric characters allowed.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 120,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
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
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.white, size: 30.0,),
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          //List<String> aspects = Provider.of<AspectListModel>(context, listen: false).aspects;
                          //sendQuery(_objAcontroller.text, _objBcontroller.text, aspects);
                          // TODO: Switch to loading screen
                          Provider.of<AspectListModel>(context, listen: false).removeAll();
                          _objAcontroller.clear();
                          _objBcontroller.clear();
                        }
                      },
                    )
                  ],
                ),
              ),
              AspectSelector(),
            ],
          ),
        ),
      )
    );
  }
}