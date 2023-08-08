import 'package:flutter/material.dart';

class hero_animations extends StatelessWidget {
  const hero_animations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero animations'),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Detail_Screen()));
          },
          child: Hero(
              tag: 'image',
              child: Image.network('https://picsum.photos/id/11/200/300')),
        ));
  }
}

class Detail_Screen extends StatelessWidget {
  const Detail_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
              tag: 'image',
              child: Image.network('https://picsum.photos/id/11/200/300'))),
    );
  }
}
