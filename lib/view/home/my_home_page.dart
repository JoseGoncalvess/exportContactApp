import 'package:exportontatcapp/view/widgets/Contactview.dart';
import 'package:exportontatcapp/view/widgets/statemenssage.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController _homecontroller = HomeController();
  bool isload = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homecontroller.addListener(() {
      setState(() {});
    });
    _homecontroller.electedIndex.addListener(() {
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
      appBar: AppBar(
        backgroundColor: ThemeData().colorScheme.primary,
        centerTitle: true,
        title: const Text(
          'AppContato',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.95,
          child: !isload
              ? const Statemenssage(msg: "Carregando Contados...")
              : ValueListenableBuilder<List<Contact>>(
                  valueListenable: _homecontroller,
                  builder: (context, value, child) => ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Contactview(
                            index: index,
                            name: value[index].displayName,
                            number: value[index].phones[0].number,
                          ),
                        );
                        // ListTile(
                        //   title: Text(
                        //     value[index].displayName,
                        //   ),
                        //   subtitle: Text(value[index].phones[0].number),
                        //   selectedTileColor: Colors.green,
                        //   selectedColor: Colors.blueGrey,
                        //   selected: index == _homecontroller.electedIndex.value,
                        //   onTap: () => _homecontroller.selectitem(index),
                        // );
                      }),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ThemeData().colorScheme.primary,
        child: const Icon(
          Icons.add_reaction_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
