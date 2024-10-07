import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';

IconButton iconButtonEdit(
    {context, int index = 0, VoidCallback? refreshState}) {
  return IconButton(
    tooltip: "Remover item",
    icon: const Icon(Icons.delete),
    style: const ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.red)),
    onPressed: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
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
                    deleteItem(
                        index: index,
                        refreshState: () {
                          refreshState!();
                        });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Apagar",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            );
          });
    },
  );
}
