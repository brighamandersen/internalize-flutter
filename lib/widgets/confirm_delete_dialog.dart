import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final Passage passage;
  final VoidCallback onConfirm;

  const ConfirmDeleteDialog({
    super.key,
    required this.passage,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Passage'),
      content: const Text(
        'Are you sure you want to delete this passage?',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        // Cancel button
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        // Confirm button
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Delete',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
