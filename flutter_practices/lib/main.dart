import 'package:flutter/material.dart';
import 'package:flutter_practices/sliver_list.dart';
import 'package:flutter_practices/sliver_practice.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sliver_List_Appbar(),
    );
  }
}
