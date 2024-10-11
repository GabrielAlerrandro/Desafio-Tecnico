import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/snackbar_error.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/utils/save_item.dart';
import 'package:flutter_application_1/utils/saved_items.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

void loadItems({VoidCallback? refreshState, context}) async {
  try {
    Variaveis.currentItens = await savedItem();
    refreshState?.call();
    Variaveis.listItens = Variaveis.currentItens;
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBarError(label: "Não foi possivel carregar os itens: $e"),
    );
  }
}

onClickSave({VoidCallback? refreshState, context}) async {
  try {
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
        refreshState?.call();
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBarError(label: "Não foi possivel salvar o item: $e"),
    );
  }
}

updateItem({context, index, Function? refreshState}) {
  try {
    Item itemUpdated = Item(
        name: Variaveis.nameEditingController.text,
        description: Variaveis.descriptionEditingController.text,
        urlImagem: Variaveis.urlEditingController.text);
    Variaveis.listItens[index] = itemUpdated;
    saveItem(itemUpdated);
    refreshState?.call();
    clearController();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBarError(label: "Não foi possivel atualizar o item: $e"),
    );
  }
}

onClickEdit({index, Function? refreshState, context}) async {
  try {
    Variaveis.currentItens = await savedItem();
    Variaveis.nameEditingController.text = Variaveis.currentItens[index].name;
    Variaveis.descriptionEditingController.text =
        Variaveis.currentItens[index].description;
    Variaveis.urlEditingController.text =
        Variaveis.currentItens[index].urlImagem;
    refreshState?.call();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBarError(
          label: "Não foi possivel atualizar os controladores de edição: $e"),
    );
  }
}

void deleteItem({int index = 0, Function? refreshState, context}) async {
  try {
    Variaveis.listItens.removeAt(index);
    saveItem(Variaveis.listItens);
    loadItems(refreshState: () {
      refreshState?.call();
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBarError(label: "Não foi possivel deletar o item: $e"),
    );
  }
}
