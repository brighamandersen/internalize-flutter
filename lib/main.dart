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
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/details': (context) => DetailsScreen(),
        '/new-passage': (context) => NewPassageScreen(),
      },
    );
  }
}
