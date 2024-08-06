import 'package:flutter/cupertino.dart';

class SelectProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedindex => _selectedIndex;

  void ChangeSelectedIndex(int index) {
    _selectedIndex = index;
    print(_selectedIndex);
    notifyListeners();
  }
}
