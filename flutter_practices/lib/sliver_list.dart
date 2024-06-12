import 'package:flutter/material.dart';

class Sliver_practice extends StatelessWidget {
  const Sliver_practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.purple[900],
          centerTitle: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: <Color>[
                Colors.purple[900]!,
                Colors.transparent
              ])),
              child:  Image.network(
                  fit: BoxFit.cover,
                  "https://images.unsplash.com/photo-1717400411765-0d6a4d0bc8db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDB8fHxlbnwwfHx8fHw%3D"),
            ),
            title: Text(style: TextStyle(color: Colors.white), "Sliver appbar"),
            centerTitle: true,
          ),
        ),
        List_generator()
      ],
    ));
  }
}

class List_generator extends StatelessWidget {
  List_generator({super.key});

  final List<Widget> containers = [
    Container(
      color: Colors.red,
      height: 150,
      width: 150,
    ),
    Container(
      color: Colors.green,
      height: 150,
      width: 150,
    ),
    Container(
      color: Colors.blue,
      height: 150,
      width: 150,
    ),
    Container(
      color: Colors.amber,
      height: 150,
      width: 150,
    ),
    Container(
      color: Colors.black,
      height: 150,
      width: 150,
    ),
    Container(
      color: Colors.cyan,
      height: 150,
      width: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: containers.length,
            (_, index) {
      return containers[index];
    }));
  }
}
