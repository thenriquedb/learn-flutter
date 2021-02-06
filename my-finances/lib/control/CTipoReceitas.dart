import 'package:fluxo/model/bd/bd_core.dart';
import 'package:fluxo/model/beans/gasto.dart';
import 'package:fluxo/model/beans/tipoGasto.dart';
import 'package:fluxo/model/beans/tipoReceita.dart';

class CTipoReceitas {
  Future<int> insert(TipoReceita g) async {
    int id = await BdCore.instance.insert(g.toMap(), BdCore.tableTipoGasto);
    print('linha inserida id: $id');
    return id;
  }

  Future<int> update(TipoReceita g) async {
    final linhasAfetadas =
        await BdCore.instance.update(g.toMap(), BdCore.tableTipoGasto);
    print('atualizadas $linhasAfetadas linha(s)');
    return linhasAfetadas;
  }

  Future<int> deletar(int id) async {
    final linhaDeletada =
        await BdCore.instance.delete(id, BdCore.tableTipoGasto);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
    return linhaDeletada;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final todasLinhas =
        await BdCore.instance.queryAllRows(BdCore.tableTipoGasto);
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
    return todasLinhas;
  }

  Future<List<TipoReceita>> getAllList() async {
    final todasLinhas =
        await BdCore.instance.queryAllRows(BdCore.tableTipoGasto);
    List<TipoReceita> lg = List.generate(todasLinhas.length, (i) {
      return TipoReceita(todasLinhas[i]['id'], todasLinhas[i]['nome'],
          todasLinhas[i]['descricao']);
    });
    return lg;
  }

  Future<TipoReceita> get(int id) async {
    String sql = ""
        "SELECT * "
        "FROM tipogasto"
        "WHERE id = $id;";
    final todasLinhas = await BdCore.instance.querySQL(sql);
    List<TipoReceita> lg = List.generate(todasLinhas.length, (i) {
      return TipoReceita(
        todasLinhas[i]['id'],
        todasLinhas[i]['nome'],
        todasLinhas[i]['descricao'],
      );
    });
    TipoReceita c = null;
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
