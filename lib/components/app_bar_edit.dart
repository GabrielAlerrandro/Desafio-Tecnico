import 'package:flutter/material.dart';

AppBar appBarEdit() {
  return AppBar(
    title: const Text("Painel Administrativo"),
    centerTitle: true,
    backgroundColor: const Color(0xFF172031),
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
