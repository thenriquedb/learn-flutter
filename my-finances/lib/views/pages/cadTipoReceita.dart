import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluxo/control/CTipoReceitas.dart';
import 'package:fluxo/model/beans/tipoReceita.dart';
import 'package:fluxo/views/widgets/custom_card.dart';

class CadTipoReceita extends StatefulWidget {
  @override
  _CadTipoReceitaState createState() => _CadTipoReceitaState();
}

class _CadTipoReceitaState extends State<CadTipoReceita> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipo de Receita"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          //card para inserção
          Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Nome:"),
                      TextField(
                        controller: _tecNome,
                      ),
                      Text("Descrição:"),
                      TextField(
                        controller: _tecDescricao,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {
                        _insereTipoReceita();
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Text("::Dados::"),
          Expanded(
            child: Card(
              child: ListView(children: _listViewTipoReceita),
            ),
          )
        ],
      ),
    );
  }

  //controllers dos texts fields
  TextEditingController _tecNome = TextEditingController();
  TextEditingController _tecDescricao = TextEditingController();

  //lista de tipo de gastos
  List<TipoReceita> _tiposReceita = List();

  //listView de tipos de gastos
  List<Widget> _listViewTipoReceita = List<Widget>();

  /**
   * Método responsável por construir o listview
   */
  _setListView() async {
    //busca lista de objetos Gasto do BD
    _tiposReceita = await CTipoReceitas().getAllList();

    //monta listView já na treade de visualização de forma dinâmica
    setState(() {
      try {
        _listViewTipoReceita = _tiposReceita
            .map((_data) => CustomCard(
                this._deleteTipoReceita,
                _data.id.toInt(),
                _data.nome.toString(),
                _data.descricao.toString()))
            .toList();
      } catch (_) {
        print("Não foi possível adicionar ao carrinho!");
      }
    });
  }

  _insereTipoReceita() {
    TipoReceita g = TipoReceita(null, _tecNome.text, _tecDescricao.text);
    CTipoReceitas().insert(g);
    setState(() {
      _setListView();
    });
  }

  _deleteTipoReceita(int id) {
    CTipoReceitas().deletar(id);
    setState(() {
      _setListView();
    });
  }

  /**
   * Método usado para inicialiar objetos e elementos ao criar a tela
   */
  @override
  void initState() {
    super.initState();

    //gera a listagem de elementos na thread de visão(de forma dinâmica)
    setState(() {
      _setListView();
    });
  }
}
