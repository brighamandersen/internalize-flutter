import 'package:flutter/material.dart';
import 'package:internalize/models/passage_model.dart';
import 'package:internalize/passage_provider.dart';
import 'package:internalize/utils.dart';
import 'package:provider/provider.dart';

class CreatePassageScreen extends StatefulWidget {
  const CreatePassageScreen({super.key});

  @override
  CreatePassageScreenState createState() => CreatePassageScreenState();
}

class CreatePassageScreenState extends State<CreatePassageScreen> {
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
      id: Utils.generateUniqueId(),
      title: _titleController.text,
      body: _bodyController.text,
    );
    context.read<PassageProvider>().addPassage(passage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Passage', style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelStyle: TextStyle(fontSize: 18),
              ),
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelStyle: TextStyle(fontSize: 18),
                ),
                expands: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: _savePassage,
                  child: const Text('Save', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
