import 'package:flutter/material.dart';

class Sliver_practice extends StatelessWidget {
  const Sliver_practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          //pinned: true,
          snap: true,
          //expandedHeight: 200.0,

          title: Text('Sliver appbar'),
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
