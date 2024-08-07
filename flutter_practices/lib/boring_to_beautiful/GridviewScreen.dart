import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/boring_to_beautiful/select_provider.dart';
import 'package:provider/provider.dart';

class Gridviewscreen extends StatelessWidget {
  const Gridviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              Provider.of<SelectProvider>(context, listen: false).Randomizer();
            },
            child: Text('Randomize')),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
              childAspectRatio: 1.5,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              crossAxisCount: 3,
              children: Provider.of<SelectProvider>(context).colorList),
        ),
      ],
    );
  }
}
