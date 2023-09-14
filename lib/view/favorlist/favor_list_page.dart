import 'package:exportontatcapp/view/home/my_home_page.dart';
import 'package:exportontatcapp/view/widgets/action_send.dart';
import 'package:flutter/material.dart';
import '../home/home_controller.dart';
import '../viewlist/viewlist_page.dart';
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
  SharedPreferenc pref = SharedPreferenc();
  final HomeController homecontroller = HomeController();

  int? selectList = null;
  bool loading = true;
  bool statebox = false;
  @override
  void initState() {
    super.initState();
    favorcontroller.addListener(() {
      setState(() {});
    });
    homecontroller.listselect.addListener(() {
      setState(() {});
    });

    favorcontroller
        .loadLsts(person: nameuser, keys: keysuUser)
        .then((value) => {
              setState(
                () => loading = false,
              )
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              homecontroller.allsSelect();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          ' Contatos favoritos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                                  chekbox: Checkbox(
                                    activeColor: Colors.blue[900],
                                    checkColor: Colors.white,
                                    side: const BorderSide(
                                        color: Colors.white,
                                        width: 9,
                                        style: BorderStyle.solid),
                                    value: index == selectList,
                                    onChanged: (value) {
                                      if (value == statebox) {
                                        setState(() {
                                          selectList = null;
                                        });
                                      } else {
                                        setState(() {
                                          selectList = index;
                                        });
                                      }
                                    },
                                  ),
                                  ontap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewlistPage(
                                              namelist: keysuUser[index],
                                              contatos: value[index]),
                                        ));
                                  },
                                  index: index,
                                  nameList: keysuUser[index],
                                  qtcontast: value[index].length.toString(),
                                ));
                          }),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectList != null) {
            ActionSend().actionAlert(context,
                msg: favorcontroller.value[selectList!].toString());
          }
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Nenhuma Lista Selecionada")));
          }
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
