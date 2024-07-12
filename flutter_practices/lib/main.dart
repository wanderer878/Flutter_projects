import 'package:flutter/material.dart';
import 'package:flutter_practices/Implicit_animations/Animated_Container.dart';
import 'package:flutter_practices/Implicit_animations/Animated_Opacity.dart';
import 'package:flutter_practices/Inherited_practice/Color_Screen.dart';
import 'package:flutter_practices/Inherited_practice/inherit_widget_practice.dart';
import 'package:flutter_practices/Layout_issues/Medium_App.dart';
import 'package:flutter_practices/SliverList_practice/sliver_list.dart';
import 'package:flutter_practices/SliverList_practice/sliver_practice.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/Screen1.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/custom_Navigator.dart';
import 'package:flutter_practices/material_motion_animations/transform_animations/List_screen.dart';
import 'package:flutter_practices/material_motion_animations/ProviderClass.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MainApp());
  //runApp(const Inherit_widget_class());
  //runApp(Menu());
  runApp(ChangeNotifierProvider(
      create: (Context) => Providerclass(),
      child: Material_motion_animations()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Color_inherit(),
      //home: Animated_Opacity(),
      home: Animated_Container(),
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

class Material_motion_animations extends StatelessWidget {
  const Material_motion_animations({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ListScreen(),
      //home: Screen1(),
      home: MyAppWithCustomNavigator(),
    );
  }
}
