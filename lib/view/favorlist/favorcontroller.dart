import 'package:exportontatcapp/model/contato_model.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

import '../../controller/shared_preferenc.dart';

class Favorcontroller extends ValueNotifier<List<ContatoModel>> {
  Favorcontroller() : super([]);
  SharedPreferenc pref = SharedPreferenc();

  var contatctemp = ValueNotifier<Map<String, dynamic>>({});
  addselectList({required List<Contact> contatos, required String key}) {
    List<String> contats = [];
    for (var c in contatos) {
      contats.add(ContatoModel(
              name: c.displayName,
              contato: c.phones[0].number,
              email: c.emails.isEmpty ? "" : c.emails[0].address)
          .toJson());
    }
    print(
      key,
    );
    print(contatos.length);
    //pref.savelis(key, contats);
  }
}
