import 'package:flutter/material.dart';

class AlertDialogSave extends StatelessWidget {
  const AlertDialogSave({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF2D3243),
      content: const Text("Item Adicionado!",
          style: TextStyle(color: Colors.white70)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, "/");
          },
          child: const Text(
            "OK!",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
