import 'package:exportontatcapp/model/contato_model.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

class Favorcontroller extends ValueNotifier<List<ContatoModel>> {
  Favorcontroller() : super([]);

  var contatctemp = ValueNotifier<Map<String, dynamic>>({});
  addselectList({required List<Contact> contatos}) {
    List<String> contats = [];
    for (var c in contatos) {
      print(ContatoModel(
              name: c.displayName,
              contato: c.phones[0].number,
              email: c.emails.isEmpty ? "" : c.emails[0].address)
          .toJson());
    }
  }
}
