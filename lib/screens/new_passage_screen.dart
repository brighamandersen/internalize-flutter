import 'package:flutter/material.dart';

class NewPassageScreen extends StatelessWidget {
  const NewPassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Passage')),
      body: Center(child: Text('Enter your new passage')),
    );
  }
}
