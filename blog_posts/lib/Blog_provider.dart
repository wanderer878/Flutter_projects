import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/word_generator.dart';

class Blog_provider extends ChangeNotifier {
  List<Map<String, dynamic>> _items = List.generate(
      50, (index) => {'title': WordGenerator().randomName(), 'id': index});

  List<Map<String, dynamic>> get items => _items;
}
