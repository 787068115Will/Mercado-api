class PessoaModel {
  late String id;
  late String nome;

  PessoaModel({required this.id, required this.nome});

  PessoaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    return data;
  }
}
