import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/scaffold_edit.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldEdit();
  }
}
