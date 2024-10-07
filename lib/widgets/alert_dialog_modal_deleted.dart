import 'package:flutter/material.dart';

class AlertDialogExcluido extends StatelessWidget {
  final VoidCallback callBackFunctionDelete;
  const AlertDialogExcluido({super.key, required this.callBackFunctionDelete});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: const Color(0xFF2D3243),
        title: const Text(
          "Confirmar Exclusão",
          style: TextStyle(color: Colors.white70),
        ),
        content: const Text("Tem certeza que deseja apagar o item?",
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              callBackFunctionDelete();
            },
            child: const Text(
              "Apagar",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
