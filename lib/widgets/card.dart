import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';
import 'package:flutter_application_1/utils/show_modals.dart';

class CardItem extends StatelessWidget {
  final int index;
  final List<Item> item;
  final Function setarEstado;
  const CardItem(
      {super.key,
      required this.index,
      required this.item,
      required this.setarEstado});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      elevation: 8,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onLongPress: () {
          Navigator.of(context).pushNamed("/edit");
          handleEdit(
              index: index,
              setarEstado: () {
                setarEstado;
              });
          showModalEdit(context, index, () => setarEstado);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  fit: BoxFit.cover,
                  item[index].urlImagem.isEmpty
                      ? "https://via.placeholder.com/450"
                      : item[index].urlImagem,
                ),
              ),
            ),
            ListTile(
              shape: const CircleBorder(),
              title: Text(item[index].name),
              subtitle: Text(item[index].description),
            ),
          ],
        ),
      ),
    );
  }
}
