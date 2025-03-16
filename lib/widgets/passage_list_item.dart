import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:fly/routes.dart';

class PassageListItem extends StatelessWidget {
  final Passage passage;
  final bool isLastItem;

  const PassageListItem({
    super.key,
    required this.passage,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom:
              isLastItem
                  ? BorderSide.none
                  : BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: ListTile(
        key: Key(passage.id),
        title: Text(passage.title, style: const TextStyle(fontSize: 18)),
        onTap: () {
          Navigator.pushNamed(context, Routes.details, arguments: passage.id);
        },
      ),
    );
  }
}
