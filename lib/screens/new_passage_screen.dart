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

  void _savePassage() {
    if (_titleController.text.isNotEmpty) {
      Passage passage = Passage(
        DateTime.now().toString(), // Generate a unique ID
        _titleController.text,
        'This is the body',
      );
      context.read<PassageProvider>().addPassage(passage);
      Navigator.pop(context); // Close screen
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter some text!')));
    }
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
              controller:
                  _titleController, // Attach the controller to the TextField
              decoration: const InputDecoration(
                labelText: 'Enter your passage',
                border: OutlineInputBorder(),
              ),
              maxLines: 5, // Set the number of lines the TextField can take
            ),
            ElevatedButton(onPressed: _savePassage, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
