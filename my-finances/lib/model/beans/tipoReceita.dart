class TipoReceita {
  int id;
  String nome;
  String descricao;

  TipoReceita(this.id, this.nome, this.descricao);

  TipoReceita.map(dynamic obj) {
    this.id = obj['id'];
    this.nome = obj['nome'];
    this.descricao = obj['descricao'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    //map["id"] = id;
    map["nome"] = nome;
    map["descricao"] = descricao;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  TipoReceita.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.descricao = map['descricao'];
  }
}
