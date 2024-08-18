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
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.network(
                "https://images.unsplash.com/photo-1721332154373-17e78d19b4a4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8",
                fit: BoxFit.cover,
              ),
            ),
            Text("data")
          ],
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
