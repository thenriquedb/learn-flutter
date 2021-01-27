
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadGasto extends StatefulWidget {

  @override
  _CadGastoState createState() => _CadGastoState();
}

class _CadGastoState extends State<CadGasto> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cad. Gastos"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}