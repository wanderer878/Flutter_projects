import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FAB_extended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add your code here
    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('floating action button extended'),
        ),
        body: Center(
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Floating action button'),
            icon: const Icon(Icons.add),
            focusColor: Colors.green,
            isExtended: Constraints.maxWidth >= 400,
          ),
        ),
      );
    });
  }
}
