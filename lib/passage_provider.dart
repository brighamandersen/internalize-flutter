import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';

class PassageProvider with ChangeNotifier {
  final List<Passage> _passages = [];

  List<Passage> get passages => _passages;

  void addPassage(Passage passage) {
    _passages.add(passage);
    notifyListeners();
  }

  void deletePassage(String passageId) {
    _passages.removeWhere((passage) => passage.id == passageId);
    notifyListeners();
  }
}
