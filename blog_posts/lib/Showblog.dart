import 'package:blog_posts/Blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Showblog extends StatelessWidget {
  const Showblog({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _list =
        Provider.of<Blog_provider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _list[index]["title"],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: Text(_list[index]["content"].toString(),
            style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}
