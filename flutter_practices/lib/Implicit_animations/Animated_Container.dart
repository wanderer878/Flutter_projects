import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animated_Container extends StatefulWidget {
  const Animated_Container({super.key});

  double randommargin() {
    return Random().nextDouble() * 64;
  }

  double randomBorderRadius() {
    return Random().nextDouble() * 64;
  }

  Color randomColor() {
    return Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }

  @override
  State<Animated_Container> createState() => _Animated_ContainerState();
}

class _Animated_ContainerState extends State<Animated_Container> {
  late double margin;
  late double borderRadius;
  late Color color;

  @override
  void initState() {
    super.initState();
    margin = widget.randommargin();
    borderRadius = widget.randomBorderRadius();
    color = widget.randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated_Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.all(margin),
                curve: Curves.decelerate,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: color),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    margin = widget.randommargin();
                    borderRadius = widget.randomBorderRadius();
                    color = widget.randomColor();
                  });
                },
                child: Text('Change'))
          ],
        ),
      ),
    );
  }
}
