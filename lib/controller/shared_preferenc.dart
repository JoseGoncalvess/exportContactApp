import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenc {
  savelis(String key, List<String> favorList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, favorList);
  }

  Future readlist(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList(key);
  }
}
