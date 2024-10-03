import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/saved_items.dart';
import 'package:flutter_application_1/widgets/scaffold_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    savedItem();
    return const ScaffoldHome();
  }
}
