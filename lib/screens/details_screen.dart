import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:fly/passage_provider.dart';
import 'package:fly/widgets/confirm_delete_dialog.dart';
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
              _showDeleteConfirmationDialog(context, passage);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text(passage.body)),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Passage passage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDeleteDialog(
          passage: passage,
          onConfirm: () {
            _deletePassage(context, passage);
          },
        );
      },
    );
  }

  void _deletePassage(BuildContext context, Passage passage) {
    context.read<PassageProvider>().deletePassage(passage.id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Passage deleted')));
    Navigator.pop(context); // Close screen
  }
}
