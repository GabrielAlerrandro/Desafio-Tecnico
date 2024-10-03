import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/utils/save_item.dart';
import 'package:flutter_application_1/utils/saved_items.dart';
import 'package:flutter_application_1/utils/variaveis.dart';
import 'package:flutter_application_1/widgets/alert_dialog_save.dart';

void loadItems({VoidCallback? setarEstado}) async {
  Variaveis.currentItens = await savedItem();
  setarEstado!();
}

handleClickSave({VoidCallback? setarEstado, context}) async {
  Variaveis.currentItens = await savedItem();
  if (Variaveis.formKey.currentState!.validate()) {
    if (Variaveis.textEditingController.text.isNotEmpty) {
      Item newItem = Item(
          id: Variaveis.textEditingController.text,
          name: Variaveis.nameEditingController.text,
          description: Variaveis.descriptionEditingController.text,
          urlImagem: Variaveis.urlEditingController.text);

      Variaveis.currentItens.add(newItem);
      // Variaveis.listItens.addAll(Variaveis.currentItens);
      saveItem(Variaveis.currentItens);

      clearController();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialogSave();
        },
      );
    }
  } else {
    const AlertDialog(
      content: Text("Invalido"),
    );
  }

  Variaveis.listItens = Variaveis.currentItens;
  loadItems(
    setarEstado: () {
      setarEstado!();
    },
  );
  print("Valor final: ${Variaveis.listItens.length}");
}

updateItem({context, index, Function? setarEstado}) {
  Item itemUpdated = Item(
      id: Variaveis.textEditingController.text,
      name: Variaveis.nameEditingController.text,
      description: Variaveis.descriptionEditingController.text,
      urlImagem: Variaveis.urlEditingController.text);
  Variaveis.listItens[index] = itemUpdated;
  saveItem(itemUpdated);
  setarEstado!();
  clearController();
  Navigator.popAndPushNamed(context, "/");
}

handleEdit({index, Function? setarEstado}) async {
  Variaveis.currentItens = await savedItem();
  Variaveis.textEditingController.text = Variaveis.currentItens[index].id;
  Variaveis.nameEditingController.text = Variaveis.currentItens[index].name;
  Variaveis.descriptionEditingController.text =
      Variaveis.currentItens[index].description;
  Variaveis.urlEditingController.text = Variaveis.currentItens[index].urlImagem;
  setarEstado!();
}

void deleteItem({int index = 0, Function? setarEstado}) async {
  Variaveis.listItens.removeAt(index);
  saveItem(Variaveis.listItens);
  loadItems(setarEstado: () {
    setarEstado!();
  });
}
