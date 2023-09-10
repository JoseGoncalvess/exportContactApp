// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContatoModel {
  final String name;
  final String contato;
  final String? email;
  ContatoModel({
    required this.name,
    required this.contato,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'contato': contato,
      'email': email,
    };
  }

  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      name: map['name'] as String,
      contato: map['contato'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContatoModel.fromJson(String source) =>
      ContatoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
