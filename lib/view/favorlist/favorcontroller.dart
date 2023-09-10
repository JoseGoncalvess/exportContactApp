import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

class Favorcontroller extends ValueNotifier<List<String>> {
  Favorcontroller() : super([]);
  var contatctemp = ValueNotifier<Map<String, dynamic>>({});
  addselectList(Contact contact, int index) {
    List<Contact> contats = [];

    contatctemp.value = Map.fromIterable(
      contats,
      key: (e) => index.toString(),
      value: (element) => contact,
    );
    print(contatctemp);
  }
}
