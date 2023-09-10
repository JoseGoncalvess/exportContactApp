import 'package:flutter/material.dart';

class FavorListPage extends StatefulWidget {
  const FavorListPage({super.key});

  @override
  State<FavorListPage> createState() => _FavorListPageState();
}

class _FavorListPageState extends State<FavorListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().colorScheme.primary,
        title: const Text('Listas Favoritas'),
      ),
      body: Container(
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}
