// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppbar {
  final int contatosselects;
  final Function back;
  final Function selethall;
  final bool statSelect;
  final Function select;
  final int contatoslength;
  CustomAppbar({
    required this.contatoslength,
    required this.select,
    required this.statSelect,
    required this.contatosselects,
    required this.back,
    required this.selethall,
  });
  PreferredSizeWidget custombar() {
    return !statSelect
        ? AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    select();
                  },
                  icon: const Icon(
                    Icons.checklist_rounded,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: const Text(
              'AppContato',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        : AppBar(
            leading: IconButton(
                onPressed: () {
                  back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: Text(
              '${contatosselects} Contatos Selecionados',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    selethall();
                  },
                  icon: contatosselects == contatoslength
                      ? const Icon(
                          Icons.close,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.fact_check_rounded,
                          color: Colors.white,
                        ))
            ],
          );
  }
}
