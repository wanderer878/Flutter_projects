import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/boring_to_beautiful/desktop_layout.dart';
import 'package:flutter_practices/boring_to_beautiful/mobile_layout.dart';
import 'package:flutter_practices/boring_to_beautiful/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key, required this.toggle_theme});
  final void Function() toggle_theme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Boring to Beautiful'),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_2_outlined),
              onPressed: () {
                toggle_theme();
              },
            ),
          ],
        ),
        body: LayoutBuilder(builder: (_, constraints) {
          return constraints.maxWidth >= 600
              ? DesktopLayout(
                  constraints: constraints,
                )
              : MobileLayout();
        }));
  }
}
