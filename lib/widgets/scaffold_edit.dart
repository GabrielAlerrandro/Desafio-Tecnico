import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_bar_edit.dart';
import 'package:flutter_application_1/widgets/list_tile_edit.dart';
import 'package:flutter_application_1/utils/show_modals.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class ScaffoldEdit extends StatefulWidget {
  const ScaffoldEdit({super.key});

  @override
  State<ScaffoldEdit> createState() => _ScaffoldEditState();
}

class _ScaffoldEditState extends State<ScaffoldEdit> {
  @override
  void initState() {
    super.initState();
    loadItems(setarEstado: () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C1633),
      appBar: appBarEdit(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: Variaveis.listItens.length,
              itemBuilder: (context, index) {
                return ListtileEdit(
                  setarEstado: () {
                    setState(() {});
                  },
                  index: index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: const Color(0xFF256EFF),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showModalAdd(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
