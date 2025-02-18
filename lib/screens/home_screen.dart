import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new-passage');
        },
        tooltip: "Add New Passage",
        child: Icon(Icons.add),
      ),
    );
  }
}
