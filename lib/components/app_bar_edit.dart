import 'package:flutter/material.dart';

AppBar appBarEdit(BuildContext context) {
  return AppBar(
    title: const Text("Painel Administrativo"),
    centerTitle: true,
    backgroundColor: const Color(0xFF172031),
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
    iconTheme: const IconThemeData(color: Colors.white),
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: "Voltar",
      onPressed: () => Navigator.popAndPushNamed(context, "/"),
    ),
  );
}
