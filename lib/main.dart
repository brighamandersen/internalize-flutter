import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fly/screens/home_screen.dart';
import 'package:fly/screens/details_screen.dart';
import 'package:fly/screens/new_passage_screen.dart';
import 'package:fly/passage_provider.dart';
import 'package:fly/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PassageAdapter());
  await Hive.openBox<Passage>('passages');
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
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomeScreen(),
      routes: {
        '/details': (context) => DetailsScreen(),
        '/new-passage': (context) => NewPassageScreen(),
      },
    );
  }
}
