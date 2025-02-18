import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int itemIndex = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(child: Text('Details for Item $itemIndex')),
    );
  }
}
