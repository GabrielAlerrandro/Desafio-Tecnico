import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

AppBar appBarHome() {
  return AppBar(
    title: const Text("Painel Principal"),
    centerTitle: true,
    backgroundColor: const Color(Variaveis.greyBlueColor),
    titleTextStyle: const TextStyle(color: Variaveis.whiteColor, fontSize: 22),
    automaticallyImplyLeading: false,
  );
}
