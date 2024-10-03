import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/saved_items.dart';
import 'package:flutter_application_1/widgets/card.dart';

class FutureBuilderHome extends StatelessWidget {
  const FutureBuilderHome({super.key, required this.setarEstado});
  final VoidCallback setarEstado;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: savedItem(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData && !snapshot.hasError && snapshot.data != null) {
          final item = snapshot.data as List<Item>;
          return ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CardItem(
                    index: index,
                    item: item,
                    setarEstado: () {
                      setarEstado();
                    },
                  )
                ],
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
