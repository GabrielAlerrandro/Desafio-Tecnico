import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/saved_items.dart';
import 'package:flutter_application_1/widgets/card.dart';

class FutureBuilderHome extends StatelessWidget {
  const FutureBuilderHome({super.key, required this.refreshState});
  final VoidCallback refreshState;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: savedItem(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(
              child: Text(
                  "Não foi possivel carregar os itens: ${snapshot.error}"));
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
                    refreshState: () {
                      refreshState();
                    },
                  )
                ],
              );
            },
          );
        }
        return const Center(
          child: Text("Nenhum item encontrado"),
        );
      },
    );
  }
}
