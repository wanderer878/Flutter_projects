import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class List_obj {
  WordPair word;
  Color color;

  List_obj({required this.word, required this.color});

  factory List_obj.fac(word, color) {
    return List_obj(word: word, color: color);
  }
}

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    List<List_obj> items_list = List.generate(
        30,
        (index) => List_obj.fac(
            WordPair.random(),
            Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0)));
    return Scaffold(
      appBar: AppBar(
        title: Text("catalog"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
          itemCount: items_list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: items_list[index].color),
                  height: 50,
                  width: 50,
                ),
                title: Text(items_list[index].word.toString()),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text("ADD"),
                ),
              ),
            );
          }),
    );
  }
}
