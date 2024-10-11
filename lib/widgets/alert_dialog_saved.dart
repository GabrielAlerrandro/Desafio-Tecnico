import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class AlertDialogSaved extends StatelessWidget {
  const AlertDialogSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: const Color(Variaveis.greyColor),
        content: const Text("Item adicionado com sucesso!",
            style: TextStyle(color: Variaveis.textWhiteColor)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.popAndPushNamed(context, "/");
            },
            child: const Text(
              "OK!",
              style: TextStyle(color: Variaveis.textWhiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
