import 'dart:developer';

import 'package:flutter/material.dart';

class Icon_Button extends StatefulWidget {
  @override
  State<Icon_Button> createState() => _Icon_ButtonState();
}

class _Icon_ButtonState extends State<Icon_Button> {
  int vol_up = 0;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Button'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  vol_up < 100 ? vol_up += 10 : vol_up;
                });
              },
              icon: const Icon(Icons.volume_up)),
          const SizedBox(
            height: 20,
          ),
          Text(
            'volume : $vol_up',
            style: style,
          ),
          const Spacer(),
          Ink(
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: Colors.amber[800]),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.android),
              color: Colors.amber[50],
            ),
          ),
          const Spacer()
        ],
      )),
    );
  }
}
