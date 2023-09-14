import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import '../favorlist/favor_list_page.dart';
import '../favorlist/favorcontroller.dart';
import '../home/home_controller.dart';
import 'dart:developer';

class AlertAction {
  Future actionAlert(BuildContext _,
      {required List<Contact> contatos,
      required List<String> keys,
      required Function() finishiSavepress}) async {
    Favorcontroller _favorcontroller = Favorcontroller();
    //final HomeController _homecontroller = HomeController();
    TextEditingController _texteditingControlle = TextEditingController();

    return showModalBottomSheet(
        context: _,
        isScrollControlled: true,
        builder: (_) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(_).viewInsets.bottom),
            child: Container(
              width: MediaQuery.sizeOf(_).width,
              height: MediaQuery.sizeOf(_).height * 0.4,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Infomação da lista",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(_).height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(_).width * 0.9,
                    child: TextField(
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
                          width: MediaQuery.sizeOf(_).width * 0.4,
                          height: MediaQuery.sizeOf(_).height * 0.05,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(_);
                              },
                              child: const Text("Cancelar"))),
                      SizedBox(
                          width: MediaQuery.sizeOf(_).width * 0.4,
                          height: MediaQuery.sizeOf(_).height * 0.05,
                          child: ElevatedButton(
                              onPressed: () async {
                                var key = _texteditingControlle.text;
                                log(nameuser);
                                log(keysuUser.toList().toString());

                                if (_texteditingControlle.text != "") {
                                  _favorcontroller
                                      // .loadLsts(
                                      //     keys: keysuUser, person: nameuser)
                                      // .then((value) => Navigator.push(
                                      //     _,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           FavorListPage(),
                                      //     )));

                                      .saveList(contatos: contatos, key: key)
                                      .then((value) {
                                    finishiSavepress();
                                    Navigator.push(
                                        _,
                                        MaterialPageRoute(
                                          builder: (_) => const FavorListPage(),
                                        ));
                                  });
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
