import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluxo/control/CTipoGasto.dart';
import 'package:fluxo/model/beans/tipoGasto.dart';
import 'package:fluxo/views/widgets/custom_card.dart';

class CadTipoGasto extends StatefulWidget {
  @override
  _CadTipoGastoState createState() => _CadTipoGastoState();
}

class _CadTipoGastoState extends State<CadTipoGasto> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  //lista de tipo de gastos
  List<TipoGasto> _expenseTypes = List();
  List<Widget> _listExpenseTypes = List<Widget>();

  @override
  void initState() {
    super.initState();

    setState(() {
      _loadExpenseTypes();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipo de Gasto"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          _buildForm(),
          Divider(
            height: 10,
          ),
          Text("::Dados::"),
          Expanded(
            child: Card(
              child: ListView(children: _listExpenseTypes),
            ),
          )
        ],
      ),
    );
  }

  _buildForm() {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nome:"),
            TextField(
              controller: _nameController,
            ),
            Text("Descrição:"),
            TextField(
              controller: _descriptionController,
            )
          ],
        ),
      ),
      Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {
                    _insereTipoGasto();
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
    ];
  }

  /**
   * Método responsável por construir o listview
   */
  _loadExpenseTypes() async {
    _expenseTypes = await CTipoGastos().getAllList();

    setState(() {
      try {
        _listExpenseTypes = _expenseTypes
            .map((_data) => CustomCard(
                  this._deleteTipoGasto,
                  id: _data.id.toInt(),
                  title: _data.nome.toString(),
                  description: _data.descricao.toString(),
                ))
            .toList();
      } catch (_) {
        print("Não foi possível adicionar ao carrinho!");
      }
    });
  }

  _insereTipoGasto() {
    TipoGasto g =
        TipoGasto(null, _nameController.text, _descriptionController.text);
    CTipoGastos().insert(g);

    setState(() {
      _loadExpenseTypes();
    });
  }

  _deleteTipoGasto(int id) {
    CTipoGastos().deletar(id);

    setState(() {
      _loadExpenseTypes();
    });
  }
}
