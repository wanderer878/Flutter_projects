import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_generator/word_generator.dart';

class BlogCubit extends Cubit<List<Map<String, dynamic>>> {
  BlogCubit()
      : super(List.generate(
            50,
            (index) => {
                  'title': WordGenerator().randomName(),
                  "content": WordGenerator().randomSentence()
                }));

  void addblog(String title, String content) {
    state.insert(0, {"title": title, "content": content});
    //print(state);
    emit(state);
  }
}
