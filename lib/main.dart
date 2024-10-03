import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/edit_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (_) => const HomePage(), '/edit': (_) => const EditPage()},
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
