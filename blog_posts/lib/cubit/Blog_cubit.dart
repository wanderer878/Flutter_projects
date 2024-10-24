import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_generator/word_generator.dart';

class BlogCubit extends Cubit<state_class> {
  BlogCubit() : super(state_class());

  void addblog(String title, String content) {
    final state_class updated_list = state_class();
    updated_list._list = List<Map<String, dynamic>>.from(state.list);
    updated_list.list.insert(0, {"title": title, "content": content});
    emit(updated_list);
  }

  void toggleThemeMode() {
    final state_class updated_theme = state_class();
    updated_theme._list = List<Map<String, dynamic>>.from(state.list);
    updated_theme._themeMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(updated_theme);
  }

  void editblog(String title, String content, int index) {
    final state_class state_copy = state_class();
    state_copy._list = List<Map<String, dynamic>>.from(state.list);
    state_copy.list[index] = {"title": title, "content": content};
    emit(state_copy);
  }

  void deleteblog(int index) {
    final state_class state_copy = state_class();
    state_copy._list = List<Map<String, dynamic>>.from(state.list);

    state_copy._list.removeAt(index);
    emit(state_copy);
  }
}

class state_class {
  List<Map<String, dynamic>> _list = List.generate(
      10,
      (index) => {
            'title': WordGenerator().randomName(),
            "content": WordGenerator().randomSentence()
          });

  ThemeMode _themeMode = ThemeMode.system;

  List<Map<String, dynamic>> get list => _list;

  ThemeMode get themeMode => _themeMode;
}
