import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/decoration_form_modal.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String textReturn;
  final TextEditingController controller;
  final String type;
  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.textReturn,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type == "img" ? TextInputType.url : TextInputType.text,
      style: const TextStyle(color: Colors.white70),
      controller: controller,
      decoration: formDecoration(label: text),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "O valor de $textReturn não pode ser vazio";
        } else if (type == "img") {
          String urlPattern =
              r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9_-]+(\.[a-zA-Z]{2,})+)(\/[^\s]*)?(\.(png|jpg))$';
          RegExp regexUrlPattern = RegExp(urlPattern);
          if (!regexUrlPattern.hasMatch(value)) {
            return "O texto digitado precisa ser uma url valida";
          }
        }
        return null;
      },
    );
  }
}
