import 'package:flutter/material.dart';

class NewPassageScreen extends StatefulWidget {
  const NewPassageScreen({super.key});

  @override
  NewPassageScreenState createState() => NewPassageScreenState();
}

class NewPassageScreenState extends State<NewPassageScreen> {
  // Create a TextEditingController to manage the input text
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Passage')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller, // Attach the controller to the TextField
              decoration: const InputDecoration(
                labelText: 'Enter your passage',
                border: OutlineInputBorder(),
              ),
              maxLines: 5, // Set the number of lines the TextField can take
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle save action
              String passageText = _controller.text; // Get the text entered
              print(
                "Saved Passage: $passageText",
              ); // For now, just print the text

              // Close the screen or navigate back
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
