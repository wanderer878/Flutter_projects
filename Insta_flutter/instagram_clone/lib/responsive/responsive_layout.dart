import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/utils/global_variables.dart';

class responsive_layout extends StatelessWidget {
  final Widget MobileScreenLayout;
  final Widget WebScreenLayout;

  const responsive_layout(
      {super.key,
      required this.MobileScreenLayout,
      required this.WebScreenLayout});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return WebScreenLayout;
      }
      return MobileScreenLayout;
    });
  }
}
