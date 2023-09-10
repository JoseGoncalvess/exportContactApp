import 'package:flutter/material.dart';

import '../home/home_controller.dart';

// ignore: must_be_immutable
class Contactview extends StatefulWidget {
  final String name;
  final String number;
  bool selectedstae;
  bool allSelect;
  final int index;
  final Function onpress;
  Contactview(
      {super.key,
      required this.name,
      required this.number,
      this.selectedstae = false,
      this.allSelect = false,
      required this.index,
      required this.onpress});

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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        height: MediaQuery.sizeOf(context).height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                height: MediaQuery.sizeOf(context).height * 0.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.sizeOf(context).width * 0.05,
                          shadows: const [
                            BoxShadow(
                                color: Color.fromARGB(200, 31, 30, 30),
                                blurRadius: 1,
                                offset: Offset(1, 1))
                          ],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.number,
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
                    activeColor: ThemeData().colorScheme.primary,
                    checkColor: Colors.white,
                    value: widget.selectedstae,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedstae = !widget.selectedstae;
                      });

                      widget.onpress();
                    },
                  )
          ],
        ),
      ),
    );
  }
}
