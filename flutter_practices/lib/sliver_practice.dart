import 'package:flutter/material.dart';

class Sliver_List_Appbar extends StatelessWidget {
  Sliver_List_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Games'),
          ),
          Sliver_list()
        ],
      ),
    );
  }
}

class Sliver_list extends StatelessWidget {
  Sliver_list({super.key});

  final List<Data> data_list = [
    Data('Fallout', 'bethesda',
        "https://images.unsplash.com/photo-1717400411765-0d6a4d0bc8db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDB8fHxlbnwwfHx8fHw%3D"),
    Data('borderlands 2', '4k games',
        "https://images.unsplash.com/photo-1717400411765-0d6a4d0bc8db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDB8fHxlbnwwfHx8fHw%3D")
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: data_list.length,
            (_, int index) {
      return ListTile(
        leading: Image.network(
          data_list[index].ImageSource,
          fit: BoxFit.cover,
        ),
        title: Text(data_list[index].title),
        subtitle: Text(data_list[index].subtitle),
      );
    }));
  }
}

class Data {
  final String title;
  final String subtitle;
  final String ImageSource;

  Data(this.title, this.subtitle, this.ImageSource);
}
