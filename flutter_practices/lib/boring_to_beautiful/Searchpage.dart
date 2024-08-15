import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              'Search',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
