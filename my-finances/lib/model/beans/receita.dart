class Receita {
  int id;
  int tipo_receita_id;
  String observacoes;
  String dataHora;
  double valor;

  Receita(this.id, this.tipo_receita_id, this.observacoes, this.dataHora,
      this.valor);

  Receita.map(dynamic obj) {
    this.id = obj['id'];
    this.tipo_receita_id = obj['tipo_receita_id'];
    this.observacoes = obj['observacoes'];
    this.dataHora = obj['dataHora'];
    this.valor = obj['valor'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["tipo_receita_id"] = tipo_receita_id;
    map["observacoes"] = observacoes;
    map["dataHora"] = dataHora;
    map["valor"] = valor;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Receita.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.tipo_receita_id = map['tipo_receita_id'];
    this.observacoes = map['observacoes'];
    this.dataHora = map['dataHora'];
    this.valor = map['valor'];
  }
}
