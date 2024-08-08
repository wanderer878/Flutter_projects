import 'dart:math';

import 'package:flutter/cupertino.dart';

class SelectProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Container> _colorList = List.generate(
      19,
      (index) => Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          ));

  int get selectedindex => _selectedIndex;
  List<Widget> get colorList => _colorList;

  void ChangeSelectedIndex(int index) {
    _selectedIndex = index;
    //print(_selectedIndex);
    notifyListeners();
  }

  void Randomizer() {
    _colorList = List.generate(
        19,
        (index) => Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            ));

    notifyListeners();
  }
}
