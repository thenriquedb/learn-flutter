import 'package:flutter/material.dart';

class BoardTile {
  final int id;
  String symbol;
  Color color;
  bool enable;

  BoardTile(this.id,
      {this.symbol = '', this.enable = true, this.color: Colors.black26});
}
