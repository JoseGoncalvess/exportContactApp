import 'dart:developer';

class FormaterMsg {
  String formater(String bruto) {
    var t1 = bruto.replaceAll('"', "");
    var t2 = t1.replaceAll("{", "");
    var t3 = t2.replaceAll("}", "");
    var t4 = t3.replaceAll("[", "");
    var t5 = t4.replaceAll("]", "");
    var string = t5.replaceAll(", ", "\n\n");
    log(string);
    return string;
  }
}
