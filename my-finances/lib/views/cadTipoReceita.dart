
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadTipoReceita extends StatefulWidget {

  @override
  _CadTipoReceitaState createState() => _CadTipoReceitaState();
}

class _CadTipoReceitaState extends State<CadTipoReceita> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipo Receita"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}