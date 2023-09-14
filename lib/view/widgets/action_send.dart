import 'package:flutter/material.dart';
import '../../controller/whatsapp_controller.dart';
import '../home/home_controller.dart';
import 'dart:developer';

class ActionSend {
  Future actionAlert(BuildContext _, {required String msg}) async {
    TextEditingController texteditingControlle = TextEditingController();

    return showModalBottomSheet(
        context: _,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Para quem deseja enviar?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: TextField(
                      controller: texteditingControlle,
                      autocorrect: true,
                      maxLines: 1,
                      maxLength: 14,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          label: Text(
                            "Numero com DDD",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          hintText: "+55 (DDD)x-xxxx-xxxx",
                          prefixIcon: Icon(
                            Icons.edit_document,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
                          fillColor: Colors.white54,
                          border: UnderlineInputBorder()),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancelar"))),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          child: ElevatedButton(
                              onPressed: () async {
                                var number = texteditingControlle.text;
                                log(nameuser);
                                log(keysuUser.toList().toString());

                                if (number.isEmpty) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Contatos não selecionado!")));
                                } else {
                                  WhatsappController().sendMenssagem(
                                      context: context,
                                      msg: msg.toString(),
                                      number: number);
                                }
                              },
                              child: const Text("Enviar")))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
