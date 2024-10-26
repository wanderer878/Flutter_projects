part of 'Blog_cubit.dart'; //this file is the part of Blog Cubit

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
