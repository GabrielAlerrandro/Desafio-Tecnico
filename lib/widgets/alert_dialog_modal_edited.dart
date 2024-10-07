import 'package:flutter/material.dart';

class AlertDialogModalEdit extends StatelessWidget {
  const AlertDialogModalEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: const Color(0xFF2D3243),
        content: const Text("Item Editado!",
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
      ),
    );
  }
}
