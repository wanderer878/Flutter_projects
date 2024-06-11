import 'package:flutter/material.dart';
import 'package:flutter_practices/sliver_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Sliver_practice()),
    );
  }
}
