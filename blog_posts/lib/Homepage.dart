import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> _items = List.generate(
      50, (index) => {'title': WordGenerator().randomName(), 'id': index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 5),
            itemCount: _items.length,
            itemBuilder: (_, index) {
              return Center(
                  child: ListTile(
                title: Text(_items[index]['title']!),
                subtitle: Text(_items[index]['id'].toString()),
              ));
            }));
  }
}
