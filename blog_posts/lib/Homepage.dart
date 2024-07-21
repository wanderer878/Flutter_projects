import 'package:blog_posts/Addblog.dart';
import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Showblog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/word_generator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //List<Map<String, dynamic>> _items = List.generate(
  //  50, (index) => {'title': WordGenerator().randomName(), 'id': index});

  @override
  Widget build(BuildContext context) {
    final _blogProvider = Provider.of<Blog_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5),
          itemCount: _blogProvider.items.length,
          itemBuilder: (_, index) {
            return InkWell(
              child: Center(
                  child: ListTile(
                title: Text(_blogProvider.items[index]['title']!),
                subtitle: Text(_blogProvider.items[index]['content'].toString()),
              )),
              onTap: () => Navigator.push(
                  _, MaterialPageRoute(builder: (_) => Showblog(index: index))),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Addbloag()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
