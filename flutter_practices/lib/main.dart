import 'package:flutter/material.dart';
import 'package:flutter_practices/Implicit_animations/Animated_Container.dart';
import 'package:flutter_practices/Implicit_animations/Animated_Opacity.dart';
import 'package:flutter_practices/Inherited_practice/Color_Screen.dart';
import 'package:flutter_practices/Inherited_practice/inherit_widget_practice.dart';
import 'package:flutter_practices/Layout_issues/Medium_App.dart';
import 'package:flutter_practices/SliverList_practice/sliver_list.dart';
import 'package:flutter_practices/SliverList_practice/sliver_practice.dart';
import 'package:flutter_practices/boring_to_beautiful/Homescreen.dart';
import 'package:flutter_practices/boring_to_beautiful/select_provider.dart';
import 'package:flutter_practices/boring_to_beautiful/theme.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/FirstPage.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/PageTransitionSwitcher.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/Screen1.dart';

import 'package:flutter_practices/material_motion_animations/shared_axis_transition/custom_Navigator/components.dart';
import 'package:flutter_practices/material_motion_animations/transform_animations/List_screen.dart';
import 'package:flutter_practices/material_motion_animations/ProviderClass.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MainApp());
  //runApp(const Inherit_widget_class());
  //runApp(Menu());
  /*runApp(ChangeNotifierProvider(
      create: (Context) => Providerclass(),
      child: Material_motion_animations()));*/
  runApp(ChangeNotifierProvider(
    create: (_) => SelectProvider(),
    child: const Boring_to_Beautiful(),
  ));
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
      //home: MyAppWithCustomNavigator(),
      //home: customNavigator(),
      //home: Firstpage(),
      home: Pagetransitionswitcher(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Boring_to_Beautiful extends StatefulWidget {
  const Boring_to_Beautiful({super.key});

  @override
  State<Boring_to_Beautiful> createState() => _Boring_to_BeautifulState();
}

class _Boring_to_BeautifulState extends State<Boring_to_Beautiful> {
  ThemeMode _themeMode = theme_Mode;

  void toggle_theme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      darkTheme: darkTheme,
      theme: themeData(),
      home: Homescreen(
        toggle_theme: toggle_theme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
