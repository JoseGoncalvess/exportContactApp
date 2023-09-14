import 'dart:convert';
import "dart:developer";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exportontatcapp/model/contato_model.dart';
import 'package:exportontatcapp/model/list_contat.model.dart';
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
  newlist(
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

  Future saveList(
      {required List<Contact> contatos, required String key}) async {
    List<String> favors = [];
    for (var e in contatos) {
      favors.add(ContatoModel(
              name: e.displayName,
              contato: e.phones.first.number,
              email: e.emails.isEmpty ? "" : e.emails.first.address)
          .toJson());
    }

    if (keysuUser.isNotEmpty) {
      if (keysuUser.contains(key)) {
        log("LISTA EXISTENTE NO DB, ATUALIZANDO.....");
        await updateList(person: nameuser, favorlisr: favors, key: key);
        log("SALVO NO BANCO DE DADOS..");
      } else if (!keysuUser.contains(key)) {
        keysuUser.add(key);
        pref.saveKeys(user: nameuser, keylist: keysuUser);
        await updateList(favorlisr: favors, key: key, person: nameuser);
        log("SALVO NO BANCO DE DADOS..");
      }
    } else {
      keysuUser.add(key);
      pref.saveKeys(user: nameuser, keylist: keysuUser);
      await newlist(favorlisr: favors, key: key, person: nameuser);
      log("NEW USER CRIADO NO BANCO DE DADOS..");
    }
  }

  Future loadLsts({required String person, required List<String> keys}) async {
    List<String> favors = [];
    DocumentSnapshot response = await user.doc(person).get();
    var map = response.data() as Map<String, dynamic>;
    var list = map.values.toList();

    log(list.runtimeType.toString());

    for (var e in list) {
      favors.add(e.toString());
    }
    getlistDb(favors);

    // var l = await getlistDb(favors);
    // log(l.toString());
  }

  getlistDb(List<String> database) async {
    List<String> favors = [];
    for (var e in database) {
      var i = jsonDecode(e);
      getlistString(i);
      log(i.toString());
      log(value.length.toString());
    }
  }

  getlistString(List list) {
    List<String> mylist = [];
    for (var item in list) {
      mylist.add(ContatoModel.fromMap(item).toJson());
    }
    value.add(mylist);
  }

  //salvar local///
  Future attList({required List<Contact> contatos, required String key}) async {
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
      pref.saveKeys(user: nameuser, keylist: keysuUser);
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
