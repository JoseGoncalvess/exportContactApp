import 'package:flutter/material.dart';

class Statemenssage extends StatelessWidget {
  final String msg;
  final bool isIcon;
  final IconData? icon;

  const Statemenssage(
      {super.key, required this.msg, required this.isIcon, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        !isIcon
            ? CircularProgressIndicator(
                color: ThemeData().primaryColor,
              )
            : Icon(
                icon,
                size: MediaQuery.sizeOf(context).height * 0.05,
                color: Colors.blue[500],
              ),
        Text(
          msg,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
              fontSize: MediaQuery.sizeOf(context).width * 0.05),
        ),
      ],
    );
  }
}
