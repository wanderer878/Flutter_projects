import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mdc_103 extends StatelessWidget {
  const Mdc_103({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Design Components 103'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "titleLarge",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "headlineMedium",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "bodySmall",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
