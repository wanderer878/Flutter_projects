import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boring to Beautiful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'display large',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10),
            Container(
              width: 150,
              height: 150,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
