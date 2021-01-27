
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadReceita extends StatefulWidget {

  @override
  _CadReceitaState createState() => _CadReceitaState();
}

class _CadReceitaState extends State<CadReceita> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cad. Receitas"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}