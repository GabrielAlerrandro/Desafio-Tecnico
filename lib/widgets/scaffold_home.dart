import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_bar_home.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';
import 'package:flutter_application_1/widgets/future_builder_home.dart';
import 'package:flutter_application_1/utils/show_modals.dart';

class ScaffoldHome extends StatefulWidget {
  const ScaffoldHome({super.key});

  @override
  State<ScaffoldHome> createState() => _ScaffoldHomeState();
}

class _ScaffoldHomeState extends State<ScaffoldHome> {
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
          appBar: appBarHome(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF256EFF),
            onPressed: () {
              Navigator.of(context).pushNamed("/edit");
              showModalAdd(context);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: FutureBuilderHome(
            refreshState: () {
              setState(() {});
            },
          )),
    );
  }
}
