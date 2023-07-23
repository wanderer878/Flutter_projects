import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  List<String> list = ["a", "b", "c"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Text(list[index]);
                })),
      ),
    );
  }
}
