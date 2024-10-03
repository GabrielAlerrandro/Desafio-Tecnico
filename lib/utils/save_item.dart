import 'dart:convert';

import 'package:flutter_application_1/utils/variaveis.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveItem(currentItens) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Map<String, dynamic>> itemsJson =
      Variaveis.listItens.map((item) => item.toJson()).toList();
  await prefs.setString("ITEM_INFOS", json.encode(itemsJson));
}
