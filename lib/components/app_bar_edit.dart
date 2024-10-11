import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

AppBar appBarEdit(BuildContext context) {
  return AppBar(
    title: const Text("Painel Administrativo"),
    centerTitle: true,
    backgroundColor: const Color(Variaveis.greyBlueColor),
    titleTextStyle: const TextStyle(color: Variaveis.whiteColor, fontSize: 22),
    iconTheme: const IconThemeData(color: Variaveis.whiteColor),
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: "Voltar",
      onPressed: () => Navigator.popAndPushNamed(context, "/"),
    ),
  );
}
