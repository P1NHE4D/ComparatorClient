import 'package:comparator/models/query_model.dart';
import 'package:comparator/widgets/com_box.dart';
import 'package:comparator/widgets/com_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AspectBox extends StatefulWidget {
  @override
  _AspectBoxState createState() => _AspectBoxState();
}

class _AspectBoxState extends State<AspectBox> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final RegExp _regExp = new RegExp(r"^\w+$");

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _validateInput(String value) {
    if (value.isEmpty) {
      return 'Must not be empty';
    }
    if (!_regExp.hasMatch(value)) {
      return 'Only alphanumeric characters allowed.';
    }
    return null;
  }

  Widget _buildAspectListItem(String aspect) {
    return ListTile(
      title: Text(
        aspect,
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Color.fromRGBO(207, 10, 10, 1),
        ),
        onPressed: () {
          Provider.of<QueryModel>(context, listen: false).removeAspect(aspect);
        },
      ),
    );
  }

  Widget _buildAspectList() {
    List<String> _aspects = Provider.of<QueryModel>(context).aspects.keys.toList();

    return ListView.separated(
      padding: EdgeInsets.all(0),
      itemCount: _aspects.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return _buildAspectListItem(_aspects[i]);
      },
      separatorBuilder: (context, i) => const Divider(
        color: Color.fromRGBO(24, 24, 24, 1),
        height: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ComBox(
      title: Text('Aspects',
          style: TextStyle(color: Color.fromRGBO(82, 82, 82, 1), fontSize: 18)),
      backgroundColor: Color.fromRGBO(48, 48, 48, 1),
      child: Column(
        children: [
          Form(
              key: _formKey,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ComTextFormField(
                          controller: _controller,
                          validator: _validateInput,
                          label: 'Add aspect',
                      )
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Provider.of<QueryModel>(context, listen: false)
                              .addAspect(_controller.text);
                          _controller.clear();
                        }
                      },
                    )
                  ],
                ),
              )
          ),
          Consumer<QueryModel>(
            builder: (context, aspectModel, child) {
              return _buildAspectList();
            },
          )
        ],
      ),
    );
  }
}
