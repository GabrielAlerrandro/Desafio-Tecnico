import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottom_sheet_decoration.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/widgets/bottom_sheet_add.dart';
import 'package:flutter_application_1/widgets/bottom_sheet_edit.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';

Future<void> showModalAdd(context) async {
  return decorationBottomSheet(
      context: context,
      builder: (context) => BottomSheetAdd(callBackFunctionAdd: () {
            handleClickSave(refreshState: () {}, context: context);
          }));

  // showModalBottomSheet(
  //     backgroundColor: const Color(0xFF172031),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
  //     barrierColor: Colors.black87.withOpacity(0.5),
  //     context: context,
  //     builder: (context) => BottomSheetAdd(callBackFunctionAdd: () {
  //           handleClickSave(refreshState: () {}, context: context);
  //         }));
}

Future<void> showModalEdit(
    context, index, Function refreshStateCallBack) async {
  return decorationBottomSheet(
      context: context,
      builder: (context) => BottomSheetEdit(
          callBackFunctionEdit: (int idx) => updateItem(
                context: context,
                index: index,
                refreshState: () {
                  refreshStateCallBack();
                },
              ),
          callBackFunctionDelete: (int idx) {
            deleteItem(
              index: idx,
              refreshState: () {
                refreshStateCallBack();
              },
            );
            clearController();
            Navigator.popAndPushNamed(context, "/");
          },
          index: index));
  // showModalBottomSheet(
  //     backgroundColor: const Color(0xFF172031),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
  //     barrierColor: Colors.black87.withOpacity(0.5),
  //     context: context,
  //     builder: (context) => BottomSheetEdit(
  //         callBackFunctionEdit: (int idx) => updateItem(
  //             context: context,
  //             index: index,
  //             refreshState: () {
  //               refreshStateCallBack();
  //             }),
  //         callBackFunctionDelete: (int idx) {
  //           deleteItem(
  //               index: idx,
  //               refreshState: () {
  //                 refreshStateCallBack();
  //               });
  //           clearController();
  //           Navigator.popAndPushNamed(context, "/");
  //         },
  //         index: index));
}
