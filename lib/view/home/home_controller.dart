import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends ValueNotifier<List<Contact>> {
  HomeController() : super([]);
  var electedIndex = ValueNotifier<int>(0);

  Future<List<Contact>> getAllContatct() async {
    PermissionStatus status = await Permission.contacts.status;
    if (status.isDenied) {
      await Permission.contacts.request();
    } else if (status.isGranted) {
      List<Contact> contacts = await FastContacts.getAllContacts();
      return value = contacts;
    }
    return value;
  }

  selectitem(int index) {
    electedIndex.value = index;
  }
}
