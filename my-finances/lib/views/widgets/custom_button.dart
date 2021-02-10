import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  CustomButton(this.onPressed, {this.label = ''});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue.shade500,
      padding: const EdgeInsets.all(20),
      onPressed: onPressed,
    );
  }
}
