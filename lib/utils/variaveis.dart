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
  static const textWhiteColor = Colors.white70;
  static const blueColor = 0xFF256EFF;
  static const deepBlueColor = 0xFF0C1633;
  static const whiteColor = Colors.white;
  static const greyColor = 0xFF2D3243;
  static const greyBlueColor = 0xFF172031;
}
