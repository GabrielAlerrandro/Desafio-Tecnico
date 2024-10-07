import 'dart:convert';
import 'package:flutter_application_1/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Item>> savedItem() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonItem = prefs.getString("ITEM_INFOS");
  if (jsonItem == null) {
    return [];
  }
  List<dynamic> mapItem = json.decode(jsonItem);
  List<Item> items = mapItem.map((item) => Item.fromJson(item)).toList();

  return items;
}
