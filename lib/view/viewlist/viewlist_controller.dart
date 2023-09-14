import 'dart:convert';
import 'dart:developer';
import 'package:exportontatcapp/model/contato_model.dart';
import 'package:flutter/material.dart';

class ViewlistController extends ValueNotifier<List<ContatoModel>> {
  ViewlistController() : super([]);

  Future<List<ContatoModel>> getContats(
      {required List<String> contatos}) async {
    for (var e in contatos) {
      var item = jsonDecode(e);
      value.add(ContatoModel.fromMap(item));
      log(item.runtimeType.toString());
    }
    return value;
  }
}
