
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadTipoGasto extends StatefulWidget {

  @override
  _CadTipoGastoState createState() => _CadTipoGastoState();
}

class _CadTipoGastoState extends State<CadTipoGasto> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipo de Gasto"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}