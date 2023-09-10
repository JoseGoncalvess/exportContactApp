import 'package:exportontatcapp/model/contato_model.dart';
import 'package:flutter/material.dart';
import '../widgets/contactview.dart';
import 'favorcontroller.dart';

class FavorListPage extends StatefulWidget {
  const FavorListPage({super.key});

  @override
  State<FavorListPage> createState() => _FavorListPageState();
}

class _FavorListPageState extends State<FavorListPage> {
  Favorcontroller _favorcontroller = Favorcontroller();
  bool selectList = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favorcontroller.addListener(() {
      setState(() {});
    });
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
          child:
              // _favorcontroller.value.isEmpty
              //     ? const Statemenssage(
              //         isIcon: true,
              //         icon: Icons.format_list_bulleted_add,
              //         msg: "Sem Contatos Favoritos")
              //     :

              ValueListenableBuilder<List<ContatoModel>>(
            valueListenable: _favorcontroller,
            builder: (context, value, child) => ListView.builder(
                itemCount: 1, //.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Contactview(
                        index: index,
                        nameList: "pessoal",
                        qtcontast: "32",
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
