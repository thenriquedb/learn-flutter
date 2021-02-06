class Gasto {
  int id;
  int tipo_gasto_id;
  String observacoes;
  String dataHora;
  double valor;

  Gasto(
      this.id, this.tipo_gasto_id, this.observacoes, this.dataHora, this.valor);

  Gasto.map(dynamic obj) {
    this.id = obj['id'];
    this.tipo_gasto_id = obj['tipo_gasto_id'];
    this.observacoes = obj['observacoes'];
    this.dataHora = obj['dataHora'];
    this.valor = obj['valor'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["tipo_gasto_id"] = tipo_gasto_id;
    map["observacoes"] = observacoes;
    map["dataHora"] = dataHora;
    map["valor"] = valor;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Gasto.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.tipo_gasto_id = map['tipo_gasto_id'];
    this.observacoes = map['observacoes'];
    this.dataHora = map['dataHora'];
    this.valor = map['valor'];
  }
}
