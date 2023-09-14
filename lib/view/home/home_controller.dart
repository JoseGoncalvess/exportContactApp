import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/shared_preferenc.dart';

class HomeController extends ValueNotifier<List<Contact>> {
  HomeController() : super([]);
  var electedIndex = ValueNotifier<int>(0);
  var listselect = ValueNotifier<bool>(false);
  SharedPreferenc pref = SharedPreferenc();

  getusername() {
    pref.loaduser().then((value) => {nameuser = value});
    return nameuser;
  }

  getkeysUser() {
    pref.getKeys(user: nameuser).then((value) => {keysuUser = value});
  }

  allsSelect() {
    listselect.value = !listselect.value;
  }

  Future<List<Contact>> getAllContatct() async {
    PermissionStatus status = await Permission.contacts.status;
    if (status.isDenied) {
      await Permission.contacts.request();
      value = await FastContacts.getAllContacts();
    } else if (status.isGranted) {
      value = await FastContacts.getAllContacts();
      return value;
    }
    return value;
  }

  selectitem(int index) {
    electedIndex.value = index;
  }
}

String nameuser = "";
List<String> keysuUser = [];
