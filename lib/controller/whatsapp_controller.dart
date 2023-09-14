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

    Uri url_android = Uri.parse(
        "whatsapp://send?phone=$number+&text=${FormaterMsg().formater(string)}");
    Uri url_ios = Uri.parse("https://wa.me/$number?text=${Uri.parse(string)}");

    if (Platform.isIOS) {
      if (await canLaunchUrl(url_ios)) {
        launchUrl(url_ios);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp não instalado")));
      }
    } else {
      if (await canLaunchUrl(url_android)) {
        launchUrl(url_android);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp não instalado")));
      }
    }
  }
}
