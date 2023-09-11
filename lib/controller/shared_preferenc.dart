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

  saveKeys({required List<String> favorList}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(endKeys, favorList);
  }

  Future<List<String>> getKeys() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log(prefs.getStringList(endKeys).toString());
    return prefs.getStringList(endKeys) ?? [];
  }
}

final String endKeys = "@key_and_keys";
