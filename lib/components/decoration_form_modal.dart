import "package:flutter/material.dart";
import "package:flutter_application_1/utils/variaveis.dart";

InputDecoration formDecoration({String? label}) {
  return InputDecoration(
    labelText: label ?? "Insira um texto",
    labelStyle: const TextStyle(color: Variaveis.textWhiteColor),
    fillColor: const Color(Variaveis.greyColor),
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
    ),
    enabledBorder: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(),
  );
}
