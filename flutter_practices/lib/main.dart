import 'package:flutter/material.dart';
import 'package:flutter_practices/Inherited_practice/Color_Screen.dart';
import 'package:flutter_practices/Inherited_practice/inherit_widget_practice.dart';
import 'package:flutter_practices/Layout_issues/Medium_App.dart';
import 'package:flutter_practices/SliverList_practice/sliver_list.dart';
import 'package:flutter_practices/SliverList_practice/sliver_practice.dart';

void main() {
  //runApp(const MainApp());
  //runApp(const Inherit_widget_class());
  runApp(Menu());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Color_inherit(),
    );
  }
}

class Inherit_widget_class extends StatelessWidget {
  const Inherit_widget_class({super.key});

  @override
  Widget build(BuildContext context) {
    return MystateWidget(
      data: 0,
      child: MaterialApp(
        home: Widget1(),
      ),
    );
  }
}
