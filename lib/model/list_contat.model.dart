// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:exportontatcapp/model/contato_model.dart';

class ListContatModel {
  final List<ContatoModel> mycontatct;
  ListContatModel({
    required this.mycontatct,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mycontatct': mycontatct.map((x) => x.toMap()).toList(),
    };
  }

  factory ListContatModel.fromMap(Map<String, dynamic> map) {
    return ListContatModel(
      mycontatct: List<ContatoModel>.from(
        (map['mycontatct'] as List<int>).map<ContatoModel>(
          (x) => ContatoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListContatModel.fromJson(String source) =>
      ListContatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
