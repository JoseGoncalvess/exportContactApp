import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenc {
  savelist(String key, List<String> favorList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, favorList);
  }

  Future<List<String>> readlist(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log(prefs.getStringList(key).toString());
    return prefs.getStringList(key) ?? [];
  }

  saveKeys({required List<String> keylist, required String user}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(user, keylist);
  }

  Future<List<String>> getKeys({required String user}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(user) ?? [];
  }

  Future saveUser({required String name}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userKeys, name);
  }

  Future loaduser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKeys) ?? "";
  }
}

final String userKeys = "@user_key";
