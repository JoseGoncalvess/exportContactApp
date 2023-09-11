import 'package:flutter/material.dart';
import '../widgets/contactview.dart';
import '../widgets/statemenssage.dart';
import 'favorcontroller.dart';
import '../../controller/shared_preferenc.dart';

class FavorListPage extends StatefulWidget {
  const FavorListPage({super.key});

  @override
  State<FavorListPage> createState() => _FavorListPageState();
}

class _FavorListPageState extends State<FavorListPage> {
  Favorcontroller favorcontroller = Favorcontroller();
  SharedPreferenc _pref = SharedPreferenc();

  bool selectList = false;
  bool loading = true;
  List<String> keys = [];
  @override
  void initState() {
    super.initState();
    favorcontroller.addListener(() {
      setState(() {});
    });
    favorcontroller.loadLists().then((value) => {
          setState(
            () => loading = false,
          )
        });
    _pref.getKeys().then((value) => setState(
          () => keys = value,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          ' Contatos favoritos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         selethall();
        //       },
        //       icon: const Icon(
        //         Icons.fact_check_rounded,
        //         color: Colors.white,
        //       ))
        // ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.95,
          child: loading
              ? const Statemenssage(isIcon: false, msg: "Carregando listas...")
              : ValueListenableBuilder<List<List<String>>>(
                  valueListenable: favorcontroller,
                  builder: (context, value, child) => value.isEmpty
                      ? const Statemenssage(
                          isIcon: true,
                          icon: Icons.format_list_bulleted_add,
                          msg: "Sem Contatos Favoritos")
                      : ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Contactview(
                                  index: index,
                                  nameList: keys[index],
                                  qtcontast: value[index].length.toString(),
                                  allSelect: selectList,
                                ));
                          }),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectList = !selectList;
          });
        },
        backgroundColor: Colors.blue[700],
        child: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}
