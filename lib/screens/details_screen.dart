import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:fly/passage_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Passage passage =
        ModalRoute.of(context)?.settings.arguments as Passage;

    return Scaffold(
      appBar: AppBar(
        title: Text(passage.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _deletePassage(context, passage);
            },
          ),
        ],
      ),
      body: Center(child: Text(passage.body)),
    );
  }

  void _deletePassage(BuildContext context, Passage passage) {
    Provider.of<PassageProvider>(
      context,
      listen: false,
    ).deletePassage(passage.id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Passage deleted')));
    Navigator.pop(context); // Close screen
  }
}
