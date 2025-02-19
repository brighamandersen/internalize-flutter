import 'package:flutter/material.dart';
import 'package:fly/screens/details_screen.dart';
import 'package:fly/screens/home_screen.dart';
import 'package:fly/screens/new_passage_screen.dart';

class Routes {
  static const String home = '/';
  static const String details = '/details';
  static const String newPassage = '/new-passage';

  static final Map<String, WidgetBuilder> routeConfig = {
    home: (context) => HomeScreen(),
    details: (context) => DetailsScreen(),
    newPassage: (context) => NewPassageScreen(),
  };
}
