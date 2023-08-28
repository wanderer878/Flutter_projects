import 'package:cart_with_provider/screens/MyCatalog.dart';
import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  List<List_obj> selectedItems = [];

  int total_price() =>
      selectedItems.fold(0, (total, current) => total + current.price);

  void addItem_price(item) {
    selectedItems.add(item);
    notifyListeners();
  }
}
