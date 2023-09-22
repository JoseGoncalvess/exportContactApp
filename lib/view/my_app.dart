import 'package:exportontatcapp/view/home/home_controller.dart';
import 'package:exportontatcapp/view/home/my_home_page.dart';
import 'package:exportontatcapp/view/user_page.dart';
import 'package:flutter/material.dart';

import '../controller/shared_preferenc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferenc pref = SharedPreferenc();
  final HomeController homecontroller = HomeController();

  @override
  void initState() {
    super.initState();
    homecontroller.getusername();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exportar Contatct',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900]!),
        useMaterial3: true,
      ),
      home: nameuser == "" ? const UserPage() : MyHomePage(),
    );
  }
}
