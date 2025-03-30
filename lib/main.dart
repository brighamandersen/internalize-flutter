import 'package:flutter/material.dart';
import 'package:internalize/constants.dart';
import 'package:internalize/models/passage_model.dart';
import 'package:internalize/routes.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internalize/passage_provider.dart';
import 'package:internalize/theme.dart';

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
      title: appDisplayName,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: Routes.routeConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
