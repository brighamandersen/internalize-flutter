import 'package:flutter/material.dart';

class NoPassagesEmptyState extends StatelessWidget {
  const NoPassagesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No passages added yet. Tap + to add one!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
