// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:exportontatcapp/model/contato_model.dart';

class ListContatModel extends ContatoModel {
  final List<ContatoModel> contatos;

  ListContatModel(
    this.contatos,
  ) : super(name: '', contato: '', email: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contatos': contatos.map((x) => x.toMap()).toList(),
    };
  }

  factory ListContatModel.fromMap(Map<String, dynamic> map) {
    return ListContatModel(
      List<ContatoModel>.from(
        (map['contatos'] as List<int>).map<ContatoModel>(
          (x) => ContatoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListContatModel.fromJson(String source) =>
      ListContatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
