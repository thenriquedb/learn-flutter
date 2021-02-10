import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluxo/views/pages/cadGasto.dart';
import 'package:fluxo/views/pages/cadReceita.dart';
import 'package:fluxo/views/pages/cadTipoGasto.dart';
import 'package:fluxo/views/pages/cadTipoReceita.dart';
import 'package:fluxo/views/pages/principal.dart';
import 'package:fluxo/views/pages/relatorios.dart';

//indice de seleção da tela
int _selectedIndex = 0;

//vetor de telas a serem utilizadas
List<Widget> _stOptions = <Widget>[
  Principal(),
  CadGasto(),
  CadReceita(),
  CadTipoGasto(),
  CadTipoReceita(),
  Relatorios(),
];

class Navegar extends StatefulWidget {
  int _selectOption;

  Navegar(this._selectOption);

  @override
  _NavegarState createState() => _NavegarState(this._selectOption);
}

class _NavegarState extends State<Navegar> {
  _NavegarState(this._opcao);
  int _opcao;

  @override
  void initState() {
    _selectedIndex = _opcao;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //corpo da aplicação, aqui são setadas as telas
      body: _stOptions.elementAt(_selectedIndex),

      //botões do BN
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Receitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Gastos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Tipos Receitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Tipo Gastos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Relatorios',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
