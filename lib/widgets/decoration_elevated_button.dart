import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function? function;

  const CustomElevatedButton(
      {super.key, required this.text, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
        onPressed: () {
          function?.call();
        },
        child: Text(text, style: const TextStyle(color: Colors.white)));
  }
}
