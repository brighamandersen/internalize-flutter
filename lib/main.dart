import 'package:flutter/material.dart';
import 'package:fly/screens/home_screen.dart';
import 'package:fly/screens/details_screen.dart';
import 'package:fly/screens/new_passage_screen.dart';
import 'package:provider/provider.dart';
import 'passage_provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => PassageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorizer',
      theme: ThemeData(
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: HomeScreen(),
      routes: {
        '/details': (context) => DetailsScreen(),
        '/new-passage': (context) => NewPassageScreen(),
      },
    );
  }
}
