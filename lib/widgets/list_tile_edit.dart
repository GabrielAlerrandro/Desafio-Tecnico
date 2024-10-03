import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/icon_button_edit.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';
import 'package:flutter_application_1/utils/show_modals.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class ListtileEdit extends StatelessWidget {
  final VoidCallback setarEstado;
  final int index;
  const ListtileEdit(
      {super.key, required this.setarEstado, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(Variaveis.listItens[index].name),
      subtitle: Text(Variaveis.listItens[index].description),
      leading: const Icon(
        Icons.image_outlined,
        color: Colors.white70,
      ),
      textColor: Colors.white,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: "Editar item",
            enableFeedback: true,
            style: const ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.white70)),
            icon: const Icon(Icons.edit_note),
            onPressed: () {
              handleEdit(
                  index: index,
                  setarEstado: () {
                    setarEstado();
                  });

              showModalEdit(context, index, () => setarEstado);
            },
          ),
          iconButtonEdit(
              context: context,
              index: index,
              setarEstado: () {
                setarEstado();
              })
        ],
      ),
    );
  }
}
