import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

SnackBar snackBarError({label}) {
  return SnackBar(
    backgroundColor: Colors.red,
    closeIconColor: Variaveis.textWhiteColor,
    content: Center(
      child: Text(label),
    ),
  );
}
