import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController T_controller;
  final String hint_text;
  final TextInputType key_type;
  final bool isPass;

  TextFieldInput(
      {super.key,
      required this.T_controller,
      required this.hint_text,
      required this.key_type,
      this.isPass = false});

  @override
  Widget build(BuildContext context) {
    InputBorder _border =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return Column(
      children: [
        TextField(
          controller: T_controller,
          decoration: InputDecoration(
              hintText: hint_text,
              border: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              filled: true,
              contentPadding: EdgeInsets.all(8.0)),
          keyboardType: key_type,
          obscureText: isPass,
        )
      ],
    );
  }
}
