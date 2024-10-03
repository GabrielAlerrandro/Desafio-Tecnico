import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/widgets/display_bottom_modal_add.dart';
import 'package:flutter_application_1/widgets/display_bottom_modal_edit.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';

Future<void> showModalAdd(context) async {
  return showModalBottomSheet(
      backgroundColor: const Color(0xFF172031),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      barrierColor: Colors.black87.withOpacity(0.5),
      context: context,
      builder: (context) => ContainerAdd(callBackFunctionAdd: () {
            handleClickSave(setarEstado: () {}, context: context);
          }));
}

Future<void> showModalEdit(context, index, Function setarEstadoCallBack) async {
  return showModalBottomSheet(
      backgroundColor: const Color(0xFF172031),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      barrierColor: Colors.black87.withOpacity(0.5),
      context: context,
      builder: (context) => ContainerEdit(
          callBackFunctionAdd: (int idx) => updateItem(
              context: context,
              index: index,
              setarEstado: () {
                setarEstadoCallBack();
              }),
          callBackFunctionDelete: (int idx) {
            deleteItem(
                index: idx,
                setarEstado: () {
                  setarEstadoCallBack();
                });
            clearController();
            Navigator.popAndPushNamed(context, "/");
          },
          index: index));
}
