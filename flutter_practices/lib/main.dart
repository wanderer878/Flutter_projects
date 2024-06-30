import 'package:flutter/material.dart';
import 'package:flutter_practices/inherit_widget_practice.dart';
import 'package:flutter_practices/sliver_list.dart';
import 'package:flutter_practices/sliver_practice.dart';

void main() {
  //runApp(const MainApp());
  runApp(const Inherit_widget_class());
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

class Inherit_widget_class extends StatelessWidget {
  const Inherit_widget_class({super.key});

  @override
  Widget build(BuildContext context) {
    return MystateWidget(
      data: 65,
      child: MaterialApp(
        home: Widget1(),
      ),
    );
  }
}
