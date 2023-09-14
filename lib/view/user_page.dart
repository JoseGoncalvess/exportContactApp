import 'package:exportontatcapp/view/home/my_home_page.dart';
import 'package:flutter/material.dart';

import '../controller/shared_preferenc.dart';
import 'favorlist/favorcontroller.dart';
import 'home/home_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  SharedPreferenc pref = SharedPreferenc();
  Favorcontroller _favorcontroller = Favorcontroller();
  final HomeController _homecontroller = HomeController();
  TextEditingController _texteditingControlle = TextEditingController();
  GlobalKey<State> _key = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: Colors.blue[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Como se Chama?",
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
                    "Nome de Usuario",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  hintText: "Ex: Ricardo, Alicia..",
                  prefixIcon: Icon(
                    Icons.edit_document,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                  fillColor: Colors.white54,
                  border: UnderlineInputBorder()),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_texteditingControlle.text != "") {
                          pref
                              .saveUser(name: _texteditingControlle.text)
                              .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyHomePage(),
                                  )));
                        }
                      },
                      child: const Text("Salvar e Posseguir")))
            ],
          )
        ],
      ),
    ));
  }
}
