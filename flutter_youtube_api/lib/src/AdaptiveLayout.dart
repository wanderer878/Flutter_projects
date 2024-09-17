import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/Detailspage.dart';
import 'package:flutter_youtube_api/src/Homepage.dart';
import 'package:split_view/split_view.dart';

class Adaptivelayout extends StatelessWidget {
  const Adaptivelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth < 600) {
        return Homepage();
      }

      return SplitView(children: [
        Homepage(),
        Detailspage(),
      ], viewMode: SplitViewMode.Horizontal);
    });
  }
}
