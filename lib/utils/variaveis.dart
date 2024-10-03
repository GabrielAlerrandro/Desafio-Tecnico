import "package:flutter/material.dart";
import "package:flutter_application_1/models/item.dart";

class Variaveis {
  static final TextEditingController nameEditingController =
      TextEditingController();
  static final TextEditingController descriptionEditingController =
      TextEditingController();
  static final TextEditingController urlEditingController =
      TextEditingController();
  static final TextEditingController textEditingController =
      TextEditingController();
  static List<Item> listItens = [];
  static List<Item> currentItens = [];
  static final formKey = GlobalKey<FormState>();
}
