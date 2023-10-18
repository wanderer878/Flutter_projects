import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

class Favourites extends ChangeNotifier {
  String current_pair = WordGenerator().randomNoun();

  get_next() {
    current_pair = WordGenerator().randomName();
    notifyListeners();
  }

  List<String> fav = [];

  get items => fav;

  toggle_Favs(word) {
    fav.contains(word) ? fav.remove(word) : fav.add(word);
    notifyListeners();
  }
}
