import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:hive/hive.dart';

class PassageProvider with ChangeNotifier {
  late Box<Passage> _passageBox;
  bool _isInitialized = false;

  PassageProvider() {
    _loadPassages();
  }

  bool get isInitialized => _isInitialized;

  List<Passage> get passages {
    if (!_isInitialized) {
      return [];
    }
    return _passageBox.values.toList();
  }

  void addPassage(Passage passage) {
    _passageBox.put(passage.id, passage);
    notifyListeners();
  }

  void deletePassage(String passageId) {
    _passageBox.delete(passageId);
    notifyListeners();
  }

  void _loadPassages() async {
    _passageBox = await Hive.openBox<Passage>('passages');
    _isInitialized = true;
    notifyListeners();
  }
}
