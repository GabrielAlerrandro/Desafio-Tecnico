import 'package:flutter/material.dart';

Future decorationBottomSheet({context, builder}) {
  return showModalBottomSheet(
    context: context,
    builder: builder,
    backgroundColor: const Color(0xFF172031),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    barrierColor: Colors.black87.withOpacity(0.5),
  );
}
