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
        // useMaterial3: false,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Black background
            foregroundColor: Colors.white, // White text
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor:
                Colors.black, // Ensures text buttons are also black
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black, // Text/icons
            side: BorderSide(color: Colors.black), // Black outline
          ),
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
