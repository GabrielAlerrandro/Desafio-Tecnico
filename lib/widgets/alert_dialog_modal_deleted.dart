import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class AlertDialogDeleted extends StatelessWidget {
  final VoidCallback callBackFunctionDelete;
  const AlertDialogDeleted({super.key, required this.callBackFunctionDelete});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: const Color(Variaveis.greyColor),
        title: const Text(
          "Confirmar Exclusão",
          style: TextStyle(color: Variaveis.textWhiteColor),
        ),
        content: const Text("Tem certeza que deseja apagar o item?",
            style: TextStyle(color: Variaveis.textWhiteColor)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Variaveis.textWhiteColor),
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
