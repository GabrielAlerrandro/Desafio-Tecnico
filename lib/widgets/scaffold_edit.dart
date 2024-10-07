import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_bar_edit.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';
import 'package:flutter_application_1/utils/show_modals.dart';

class ScaffoldEdit extends StatefulWidget {
  const ScaffoldEdit({super.key});

  @override
  State<ScaffoldEdit> createState() => _ScaffoldEditState();
}

class _ScaffoldEditState extends State<ScaffoldEdit> {
  @override
  void initState() {
    super.initState();
    loadItems(refreshState: () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF0C1633),
        appBar: appBarEdit(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF256EFF),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalAdd(context);
          },
        ),
      ),
    );
  }
}
