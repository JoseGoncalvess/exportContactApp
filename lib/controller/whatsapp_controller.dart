import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/formater_msg.dart';

class WhatsappController {
  sendMenssagem(
      {required BuildContext context,
      required String msg,
      required String number}) async {
    var string = FormaterMsg().formater(msg);

    Uri url = Uri.parse("https://wa.me/$number?text=$string");

    try {
      await launchUrl(url);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Erro ao Direcionar para Whatsapp!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).width * 0.03,
              ))));
    }
  }
}
