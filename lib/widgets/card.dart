import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/utils/crud_functions.dart';
import 'package:flutter_application_1/utils/show_modals.dart';

class CardItem extends StatelessWidget {
  final int index;
  final List<Item> item;
  final Function refreshState;
  const CardItem(
      {super.key,
      required this.index,
      required this.item,
      required this.refreshState});

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
              refreshState: () {
                refreshState;
              });
          showModalEdit(context, index, () => refreshState);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(
                      Icons.image,
                      size: 50,
                    ),
                  ),
                  item[index].urlImagem,
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
