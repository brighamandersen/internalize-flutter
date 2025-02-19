import 'package:flutter/material.dart';
import 'package:fly/passage_provider.dart';
import 'package:fly/routes.dart';
import 'package:fly/widgets/no_passages_empty_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memorizer')),
      body: Consumer<PassageProvider>(
        builder: (context, passageProvider, child) {
          if (!passageProvider.isInitialized) {
            return Center(child: CircularProgressIndicator());
          }

          if (passageProvider.passages.isEmpty) {
            return const NoPassagesEmptyState();
          }

          return ListView.builder(
            itemCount: passageProvider.passages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        index < passageProvider.passages.length - 1
                            ? BorderSide(color: Colors.grey.shade300, width: 1)
                            : BorderSide.none,
                  ),
                ),
                child: ListTile(
                  title: Text(passageProvider.passages[index].title),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.details,
                      arguments: passageProvider.passages[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.newPassage);
        },
        tooltip: "Add New Passage",
        child: const Icon(Icons.add),
      ),
    );
  }
}
