import "package:flutter/material.dart";

InputDecoration formDecoration({String? label}) {
  return InputDecoration(
    labelText: label ?? "Insira um texto",
    labelStyle: const TextStyle(color: Colors.white70),
    fillColor: const Color(0xFF2D3243),
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
    ),
    enabledBorder: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(),
  );
}
