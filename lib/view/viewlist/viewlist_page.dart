import 'package:exportontatcapp/view/viewlist/viewlist_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_Appbar.dart';
import '../widgets/statemenssage.dart';

class ViewlistPage extends StatefulWidget {
  final List<String> contatos;
  const ViewlistPage({super.key, required this.contatos});

  @override
  State<ViewlistPage> createState() => _ViewlistPageState();
}

class _ViewlistPageState extends State<ViewlistPage> {
  ViewlistController vieweCOntroller = ViewlistController();
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    vieweCOntroller.addListener(() {
      setState(() {});
    });
    vieweCOntroller
        .getContats(contatos: widget.contatos)
        .then((value) => setState(
              () => isloading = false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        select: () => {},
        contatosselects: 0,
        selethall: () {},
        back: () {},
        statSelect: false,
      ).custombar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.95,
            child: isloading
                ? const Statemenssage(
                    isIcon: false, msg: "Carregando Contados...")
                : ValueListenableBuilder(
                    valueListenable: vieweCOntroller,
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
                                  value[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.05,
                                      color: Colors.blue[800]),
                                ),
                                subtitle: Text(
                                  value[index].contato,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.03,
                                      color: Colors.grey[600]),
                                ),
                                selectedColor: Colors.indigo[50],
                                selectedTileColor: Colors.lightBlue[900],
                                leading: const CircleAvatar(
                                    child: Icon(Icons.person)),
                                onTap: () {},
                              ));
                        }),
                  ),
          ),
        ),
      ),
    );
  }
}
