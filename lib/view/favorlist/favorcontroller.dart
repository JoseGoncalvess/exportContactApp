import 'dart:convert';
import "dart:developer";
import 'package:exportontatcapp/model/contato_model.dart';
import 'package:exportontatcapp/model/list_contat.model.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

import '../../controller/shared_preferenc.dart';

class Favorcontroller extends ValueNotifier<List<List<String>>> {
  Favorcontroller() : super([]);
  SharedPreferenc pref = SharedPreferenc();

  var contatctemp = ValueNotifier<Map<String, dynamic>>({});
  Future addselectList(
      {required List<Contact> contatos, required String key}) async {
    List<String> favors = [];
    pref.getKeys().then((keys) {
      if (!keys.contains(key)) {
        for (var e in contatos) {
          favors.add(ContatoModel(
                  name: e.displayName,
                  contato: e.phones.first.number,
                  email: e.emails.isEmpty ? "" : e.emails.first.address)
              .toJson());
        }
        keys.add(key);
        pref.saveKeys(favorList: keys);
        pref.savelist(key, favors);

        log("Rocesso de salvar.... Acbou");
      }
    });
  }

  Future<List<List<String>>> loadLists() async {
    pref.getKeys().then((listkey) async {
      for (String key in listkey) {
        var listfavor = await getsListContatos(key: key);
        log(listfavor.toString());
        value.add(listfavor);
      }
    });

    return value;
  }

  Future<List<String>> getsListContatos({required String key}) async {
    List<String> mycontatos = [];
    await pref.readlist(key).then((listContatos) async {
      mycontatos = listContatos;
    });
    return mycontatos;
  }
}
