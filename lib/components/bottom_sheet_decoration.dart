import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

Future decorationBottomSheet({context, builder}) {
  return showModalBottomSheet(
    context: context,
    builder: builder,
    backgroundColor: const Color(Variaveis.greyBlueColor),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    barrierColor: Colors.black87.withOpacity(0.5),
  );
}
