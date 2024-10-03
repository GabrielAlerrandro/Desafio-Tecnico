import 'package:flutter/material.dart';

class AlertDialogModalEdit extends StatelessWidget {
  final VoidCallback callBackFunctionAdd;
  const AlertDialogModalEdit({super.key, required this.callBackFunctionAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF2D3243),
      content:
          const Text("Item Editado!", style: TextStyle(color: Colors.white70)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            callBackFunctionAdd();
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
