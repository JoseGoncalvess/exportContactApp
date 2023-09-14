import 'dart:developer';

import 'package:exportontatcapp/view/favorlist/favor_list_page.dart';
import 'package:exportontatcapp/view/widgets/alert_action.dart';
import 'package:exportontatcapp/view/widgets/custom_Appbar.dart';
import 'package:exportontatcapp/view/widgets/statemenssage.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

import '../../controller/shared_preferenc.dart';
import '../favorlist/favorcontroller.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _homecontroller = HomeController();
  final Favorcontroller _favorcontroller = Favorcontroller();
  SharedPreferenc pref = SharedPreferenc();

  bool isload = false;
  List<Contact> selectcontats = [];
  List<String> keys = [];
  @override
  void initState() {
    super.initState();
    _homecontroller.getusername();

    _homecontroller.addListener(() {
      setState(() {});
    });
    _homecontroller.getkeysUser();
    _homecontroller.electedIndex.addListener(() {
      setState(() {});
    });
    _homecontroller.listselect.addListener(() {
      setState(() {});
    });

    _homecontroller.getAllContatct().then((value) => setState(
          () {
            isload = true;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        select: () => _homecontroller.allsSelect(),
        statSelect: _homecontroller.listselect.value,
        contatosselects: selectcontats.length,
        selethall: () {
          setState(() {
            selectcontats = _homecontroller.value;
          });
        },
        back: () {
          selectcontats = [];
          _homecontroller.allsSelect();
        },
      ).custombar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.95,
            child: !isload
                ? const Statemenssage(
                    isIcon: false, msg: "Carregando Contados...")
                : ValueListenableBuilder<List<Contact>>(
                    valueListenable: _homecontroller,
                    builder: (context, value, child) => ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ListTile(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                title: Text(
                                  value[index].displayName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.05,
                                      color: Colors.blue[800]),
                                ),
                                subtitle: Text(
                                  value[index].phones.first.number,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.03,
                                      color: Colors.grey[600]),
                                ),
                                selectedColor: Colors.indigo[50],
                                selectedTileColor: Colors.lightBlue[900],
                                selected: selectcontats.contains(value[index]),
                                leading: (selectcontats.contains(value[index]))
                                    ? const CircleAvatar(
                                        child: Icon(Icons.check_circle))
                                    : const CircleAvatar(
                                        child: Icon(Icons.person)),
                                onTap: () {
                                  _homecontroller.listselect.value
                                      ? setState(() {
                                          (selectcontats.contains(value[index]))
                                              ? selectcontats
                                                  .remove(value[index])
                                              : selectcontats.add(value[index]);
                                        })
                                      : null;
                                },
                              ));
                        }),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          !_homecontroller.listselect.value
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavorListPage(),
                  ))
              : AlertAction()
                  .actionAlert(context, contatos: selectcontats, keys: keys);
        },
        backgroundColor: Colors.blue[700],
        child: Icon(
          _homecontroller.listselect.value ? Icons.save : Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }
}
