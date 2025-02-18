import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:fly/passage_provider.dart';
import 'package:provider/provider.dart';

class NewPassageScreen extends StatefulWidget {
  const NewPassageScreen({super.key});

  @override
  NewPassageScreenState createState() => NewPassageScreenState();
}

class NewPassageScreenState extends State<NewPassageScreen> {
  // Create a TextEditingController to manage the input text
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  void _savePassage() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a title')));
      return;
    }

    if (_bodyController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a body')));
      return;
    }

    Passage passage = Passage(
      DateTime.now().toString(), // Generate a unique ID
      _titleController.text,
      _bodyController.text,
    );
    context.read<PassageProvider>().addPassage(passage);
    Navigator.pop(context); // Close screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Passage')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: 20,
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _savePassage, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
