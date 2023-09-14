import 'dart:convert';
import "dart:developer";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exportontatcapp/model/contato_model.dart';
import 'package:exportontatcapp/view/home/home_controller.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

import '../../controller/shared_preferenc.dart';

class Favorcontroller extends ValueNotifier<List<List<String>>> {
  Favorcontroller() : super([]);
  SharedPreferenc pref = SharedPreferenc();
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

//crair uma nova coleção para o usuario
  newuser(
      {required List<String> favorlisr,
      required String key,
      required String person}) async {
    return user.doc(person).set({key: favorlisr});
  }

//add a lista a usuario existente
  updateList(
      {required String person,
      required List<String> favorlisr,
      required String key}) async {
    return await user.doc(person).update({key: favorlisr});
  }

  Future loadLsts({required String person, required List<String> keys}) async {
    List<String> favors = [];
    DocumentSnapshot response = await user.doc(person).get();
    var map = response.data() as Map<String, dynamic>;
    for (var k in keysuUser) {
      //var item = map[k] as Map<String, dynamic>;
      map.forEach((key, value) {
        for (var e in value) {
          var i = ContatoModel.fromMap(jsonDecode(value[0]));
          favors.add(i.toString());
        }
      });

      // favors.add(item.toString());
      // log(favors.toString());
      value.add(favors);
    }
  }

  Future saveList(
      {required List<Contact> contatos, required String key}) async {
    List<String> favors = [];
    if (!keysuUser.contains(key)) {
      for (var e in contatos) {
        favors.add(ContatoModel(
                name: e.displayName,
                contato: e.phones.first.number,
                email: e.emails.isEmpty ? "" : e.emails.first.address)
            .toJson());
      }
      keysuUser.add(key);
      pref.saveKeys(user: nameuser, favorList: keysuUser);
      await newuser(favorlisr: favors, key: key, person: nameuser);
      log("Rocesso de salvar.... Acbou");
    }
  }

  //salvar local///
  Future updatelist(
      {required List<Contact> contatos, required String key}) async {
    List<String> favors = [];
    if (!keysuUser.contains(key)) {
      for (var e in contatos) {
        favors.add(ContatoModel(
                name: e.displayName,
                contato: e.phones.first.number,
                email: e.emails.isEmpty ? "" : e.emails.first.address)
            .toJson());
      }
      keysuUser.add(key);
      pref.saveKeys(user: nameuser, favorList: keysuUser);
      updateList(person: nameuser, favorlisr: favors, key: key);
      log("Rocesso de salvar.... Acbou");
    }
  }

  Future<List<List<String>>> loadLists() async {
    for (String key in keysuUser) {
      var listfavor = await getsListContatos(key: key);
      log(listfavor.toString());
      value.add(listfavor);
    }

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
