import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

class Adaptivelayout extends StatelessWidget {
  const Adaptivelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth < 600) {
        return Center(
          child: Text('mobile'),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: Text("Adaptive Page"),
        ),
        body: SplitView(children: [
          Center(
            child: Text('Hello'),
          ),
          Center(
            child: Text('world'),
          )
        ], viewMode: SplitViewMode.Horizontal),
      );
    });
  }
}
