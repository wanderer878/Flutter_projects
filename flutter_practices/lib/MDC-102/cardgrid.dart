import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  CardGrid({super.key});

  List<Card> _list = List.generate(10, (index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(index.toString())],
        ),
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Grid'),
      ),
      body: GridView.count(
        childAspectRatio: 8.0 / 9.0,
        crossAxisCount: 2,
        //mainAxisSpacing: 3,
        children: _list,
      ),
    );
  }
}
