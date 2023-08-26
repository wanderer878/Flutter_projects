import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  List<WordPair> selectedItems = [];

  void addItem(item) {
    selectedItems.add(item);
    notifyListeners();
  }
}
