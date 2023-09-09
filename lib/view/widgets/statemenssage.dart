import 'package:flutter/material.dart';

class Statemenssage extends StatelessWidget {
  final String msg;

  const Statemenssage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: ThemeData().primaryColor,
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
