import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;

  CustomTextField(this.controller,
      {this.labelText = '', this.obscureText = false, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: this.hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        labelText: labelText,
      ),
    );
  }
}
