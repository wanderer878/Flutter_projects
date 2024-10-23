import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/word_generator.dart';

class Blog_provider extends ChangeNotifier {
  List<Map<String, dynamic>> _items = List.generate(
      50,
      (index) => {
            'title': WordGenerator().randomName(),
            "content": WordGenerator().randomSentence()
          });

  ThemeMode _themeMode = ThemeMode.system;

  List<Map<String, dynamic>> get items => _items;
  ThemeMode get themeMode => _themeMode;

  void toggleThemeMode() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void addblog(String title, String content) {
    _items.insert(0, {"title": title, "content": content});
    //print("$title $content");
    notifyListeners();
  }

  void editblog(String title, String content, int index) {
    ;
    _items[index] = {"title": title, "content": content};
    notifyListeners();
  }

  void deleteblog(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
