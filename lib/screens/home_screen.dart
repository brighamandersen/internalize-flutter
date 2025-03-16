import 'package:flutter/material.dart';
import 'package:fly/passage_provider.dart';
import 'package:fly/routes.dart';
import 'package:fly/widgets/no_passages_empty_state.dart';
import 'package:fly/widgets/passage_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorizer', style: TextStyle(fontSize: 24)),
      ),
      body: Consumer<PassageProvider>(
        builder: (context, passageProvider, child) {
          if (!passageProvider.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          if (passageProvider.passages.isEmpty) {
            return const NoPassagesEmptyState();
          }

          return ListView.builder(
            itemCount: passageProvider.passages.length,
            itemBuilder: (context, index) {
              final passage = passageProvider.passages[index];
              return PassageListItem(
                passage: passage,
                isLastItem: index == passageProvider.passages.length - 1,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createPassage);
        },
        tooltip: "Add New Passage",
        child: const Icon(Icons.add),
      ),
    );
  }
}
