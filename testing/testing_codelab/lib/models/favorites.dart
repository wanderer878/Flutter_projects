import 'package:flutter/material.dart';

class Favourites extends ChangeNotifier {
  final List<int> _favoriteItems = [
    10,
  ];

  List<int> get items => _favoriteItems;

  void add(int itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}
