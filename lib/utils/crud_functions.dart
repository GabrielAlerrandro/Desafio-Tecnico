import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/utils/save_item.dart';
import 'package:flutter_application_1/utils/saved_items.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

void loadItems({VoidCallback? refreshState}) async {
  Variaveis.currentItens = await savedItem();
  refreshState!();
  Variaveis.listItens = Variaveis.currentItens;
}

handleClickSave({VoidCallback? refreshState, context}) async {
  Variaveis.currentItens = await savedItem();
  if (Variaveis.formKey.currentState!.validate()) {
    if (Variaveis.nameEditingController.text.isNotEmpty &&
        Variaveis.descriptionEditingController.text.isNotEmpty) {
      Item newItem = Item(
          name: Variaveis.nameEditingController.text,
          description: Variaveis.descriptionEditingController.text,
          urlImagem: Variaveis.urlEditingController.text);

      Variaveis.currentItens.add(newItem);
      saveItem(Variaveis.currentItens);

      clearController();
    }
  }

  Variaveis.listItens = Variaveis.currentItens;
  loadItems(
    refreshState: () {
      refreshState!();
    },
  );
}

updateItem({context, index, Function? refreshState}) {
  Item itemUpdated = Item(
      name: Variaveis.nameEditingController.text,
      description: Variaveis.descriptionEditingController.text,
      urlImagem: Variaveis.urlEditingController.text);
  Variaveis.listItens[index] = itemUpdated;
  saveItem(itemUpdated);
  refreshState!();
  clearController();
}

handleEdit({index, Function? refreshState}) async {
  Variaveis.currentItens = await savedItem();
  Variaveis.nameEditingController.text = Variaveis.currentItens[index].name;
  Variaveis.descriptionEditingController.text =
      Variaveis.currentItens[index].description;
  Variaveis.urlEditingController.text = Variaveis.currentItens[index].urlImagem;
  refreshState!();
}

void deleteItem({int index = 0, Function? refreshState}) async {
  Variaveis.listItens.removeAt(index);
  saveItem(Variaveis.listItens);
  loadItems(refreshState: () {
    refreshState!();
  });
}
