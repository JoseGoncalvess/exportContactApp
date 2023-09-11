import 'package:exportontatcapp/view/viewlist/viewlist_page.dart';
import 'package:flutter/material.dart';

import '../home/home_controller.dart';

// ignore: must_be_immutable
class Contactview extends StatefulWidget {
  final String nameList;
  final String qtcontast;
  bool selectedstae;
  bool allSelect;
  final int index;
  final Function() ontap;

  Contactview({
    super.key,
    required this.nameList,
    required this.qtcontast,
    this.selectedstae = false,
    this.allSelect = false,
    required this.index,
    required this.ontap,
  });

  @override
  State<Contactview> createState() => _ContactviewState();
}

class _ContactviewState extends State<Contactview> {
  final HomeController _homecontroller = HomeController();
  @override
  void initState() {
    super.initState();
    _homecontroller.electedIndex.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          widget.ontap();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          height: MediaQuery.sizeOf(context).height * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: MediaQuery.sizeOf(context).width * 0.07,
                backgroundColor: Colors.blue[900],
                child: Icon(
                  Icons.list_alt_rounded,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.nameList,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width * 0.06,
                            shadows: const [
                              BoxShadow(
                                  color: Color.fromARGB(200, 31, 30, 30),
                                  blurRadius: 1,
                                  offset: Offset(1, 1))
                            ],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Nº de contatos: ${widget.qtcontast}",
                        style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          shadows: const [
                            BoxShadow(
                                color: Color.fromARGB(199, 44, 44, 44),
                                blurRadius: 1,
                                offset: Offset(1, 1))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              !widget.allSelect
                  ? Container()
                  : Checkbox(
                      activeColor: Colors.blue[900],
                      checkColor: Colors.white,
                      side: const BorderSide(
                          color: Colors.white,
                          width: 9,
                          style: BorderStyle.solid),
                      value: widget.selectedstae,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedstae = !widget.selectedstae;
                        });
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
