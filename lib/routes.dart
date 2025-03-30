import 'package:flutter/material.dart';
import 'package:internalize/screens/details_screen.dart';
import 'package:internalize/screens/edit_passage_screen.dart';
import 'package:internalize/screens/home_screen.dart';
import 'package:internalize/screens/create_passage_screen.dart';

class Routes {
  static const String home = '/';
  static const String details = '/details';
  static const String createPassage = '/create-passage';
  static const String editPassage = '/edit-passage';

  static final Map<String, WidgetBuilder> routeConfig = {
    home: (context) => HomeScreen(),
    details: (context) => DetailsScreen(),
    createPassage: (context) => CreatePassageScreen(),
    editPassage: (context) => EditPassageScreen(),
  };
}
