import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Relatorios extends StatefulWidget {
  @override
  _RelatoriosState createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relatórios"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
