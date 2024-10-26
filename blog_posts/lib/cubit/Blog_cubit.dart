import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_generator/word_generator.dart';

part 'State_class.dart'; //state class is part of this file

class BlogCubit extends Cubit<state_class> {
  BlogCubit() : super(state_class());

  void addblog(String title, String content) {
    final state_class updated_list = state_class();
    updated_list._list = List<Map<String, dynamic>>.from(state.list);
    updated_list.list.insert(0, {"title": title, "content": content});
    /* if we have inserted into the original state list , to state same rehti, 
    emit krne pr kuch nhi hta kynke state to srf update hwi hai address to same
    hi hai , islye hmne pehly aik new list create kri phr usko new state ke 
    tor pr pass karaya . hm [{"title": title, "content": content},...state]
    bhi use krskty hain. immutable data types (int, double, etc.) me yeh nahi krna parta jese
    state + 1 kynke usme hamesha new copy bnti hai mgr mutable data types
    (list, etc.) me yeh krna parta hai*/
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
