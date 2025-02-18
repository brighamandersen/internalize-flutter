import 'package:flutter/material.dart';
import 'package:fly/passage_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memorizer')),
      body: Consumer<PassageProvider>(
        builder: (context, passageProvider, child) {
          if (passageProvider.passages.isEmpty) {
            return const Center(
              child: Text(
                'No passages added yet. Tap + to add one!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          return ListView.builder(
            itemCount: passageProvider.passages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(passageProvider.passages[index].title),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: passageProvider.passages[index],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new-passage');
        },
        tooltip: "Add New Passage",
        child: const Icon(Icons.add),
      ),
    );
  }
}
