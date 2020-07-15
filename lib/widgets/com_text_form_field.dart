import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComTextFormField extends StatelessWidget {
  final TextInputAction inputAction;
  final String label;
  final FormFieldValidator<String> validator;
  final String initialValue;
  final TextEditingController controller;

  ComTextFormField(
      {this.validator,
      this.controller,
      this.initialValue,
      this.label,
      this.inputAction = TextInputAction.done});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      controller: controller,
      validator: validator,
      textInputAction: inputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(82, 82, 82, 1),
            width: 0,
          ),
        ),
        filled: true,
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        fillColor: Color.fromRGBO(82, 82, 82, 1),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
