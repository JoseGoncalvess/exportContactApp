import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

import '../favorlist/favorcontroller.dart';

class AlertAction {
  Future actionAlert(BuildContext _, {required List<Contact> contatos}) async {
    Favorcontroller _favorcontroller = Favorcontroller();
    TextEditingController _texteditingControlle = TextEditingController();
    GlobalKey<State> _key = GlobalKey<State>();
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
                    "Infomação da lista",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: TextField(
                      key: _key,
                      controller: _texteditingControlle,
                      autocorrect: true,
                      maxLines: 1,
                      maxLength: 10,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          label: Text(
                            "Nome dalista...",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          hintText: "Ex: Amigos",
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
                              onPressed: () {
                                if (_texteditingControlle.text != "" ||
                                    _texteditingControlle.text != null) {
                                  _favorcontroller.addselectList(
                                    key: _texteditingControlle.text,
                                    contatos: contatos,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text("Salvar Lista")))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
