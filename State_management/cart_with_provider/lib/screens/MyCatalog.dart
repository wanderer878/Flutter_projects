import 'package:cart_with_provider/Notifying_classes/Items.dart';
import 'package:cart_with_provider/screens/MyCart.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class List_obj {
  WordPair word;
  Color color;
  int price;

  List_obj({required this.word, required this.color, required this.price});

  factory List_obj.fac(word, color, price) {
    return List_obj(word: word, color: color, price: price);
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
                .withOpacity(1.0),
            math.Random().nextInt(200 - 10 + 1) + 10));
    return Scaffold(
      appBar: AppBar(
        title: Text("catalog"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyCart()));
              },
              icon: const Icon(Icons.shopping_cart))
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
                trailing: Consumer<Items>(
                  builder: (context, item, child) {
                    return TextButton(
                        onPressed:
                            item.selectedItems.contains(items_list[index])
                                ? null
                                : () {
                                    Provider.of<Items>(context, listen: false)
                                        .addItem_price(
                                      items_list[index],
                                    );
                                  },
                        child: Text('ADD'));
                  },
                ),
              ),
            );
          }),
    );
  }
}
