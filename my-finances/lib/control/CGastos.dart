import 'package:fluxo/model/bd/bd_core.dart';
import 'package:fluxo/model/beans/gasto.dart';

class CGastos {
  Future<int> insert(Gasto g) async {
    int id = await BdCore.instance.insert(g.toMap(), BdCore.tableGasto);
    print('linha inserida id: $id');
    return id;
  }

  Future<int> update(Gasto g) async {
    final linhasAfetadas =
        await BdCore.instance.update(g.toMap(), BdCore.tableGasto);
    print('atualizadas $linhasAfetadas linha(s)');
    return linhasAfetadas;
  }

  Future<int> deletar(int id) async {
    //final id = await BdCore.instance.queryRowCount(BdCore.tableGasto);
    final linhaDeletada = await BdCore.instance.delete(id, BdCore.tableGasto);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
    return linhaDeletada;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final todasLinhas = await BdCore.instance.queryAllRows(BdCore.tableGasto);
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
    return todasLinhas;
  }

  Future<List<Gasto>> getAllList() async {
    final todasLinhas = await BdCore.instance.queryAllRows(BdCore.tableGasto);
    List<Gasto> lg = List.generate(todasLinhas.length, (i) {
      return Gasto(
          todasLinhas[i]['id'],
          todasLinhas[i]['tipo_gasto_id'],
          todasLinhas[i]['observacoes'],
          todasLinhas[i]['dataHora'],
          todasLinhas[i]['valor']);
    });
    return lg;
  }

  Future<Gasto> get(int id) async {
    String sql = ""
        "SELECT * "
        "FROM gasto "
        "WHERE id = $id;";
    final todasLinhas = await BdCore.instance.querySQL(sql);
    List<Gasto> lg = List.generate(todasLinhas.length, (i) {
      return Gasto(
          todasLinhas[i]['id'],
          todasLinhas[i]['tipo_gasto_id'],
          todasLinhas[i]['observacoes'],
          todasLinhas[i]['dataHora'],
          todasLinhas[i]['valor']);
    });
    Gasto c = null;
    try {
      c = lg.elementAt(0);
    } catch (_) {}
    return c;
  }
/*
  ///Select na tabela de pessoas fazendo join com a tabela de clientes,
  ///retornando a lista de todos os clientes tambem com as informações da tabela pessoa.
  Future<List<PessoaAmbulante>> getAllListAmbulante() async {
    String sql =
        "SELECT "
        " ambulante.id as id, "
        " pessoa.nome as nome, "
        " pessoa.sobrenome as sobrenome, "
        " pessoa.cpf as cpf, "
        " pessoa.observacao as observacao, "
        " ambulante.latitude as latitude, "
        " ambulante.longitude as longitude "

        "FROM "
        " pessoa INNER JOIN ambulante ON(pessoa.id = ambulante.pessoa_id);";

    final todasLinhas = await BdCore.instance.querySQL(sql);
    List<PessoaAmbulante> lc = List.generate(todasLinhas.length, (i) {
      return PessoaAmbulante(
          todasLinhas[i]['id'],
          todasLinhas[i]['nome'],
          todasLinhas[i]['sobrenome'],
          todasLinhas[i]['cpf'],
          todasLinhas[i]['obsevacao'],
          todasLinhas[i]['latitude'],
          todasLinhas[i]['longitude']
      );
    });
    return lc;
  }
*/
}
