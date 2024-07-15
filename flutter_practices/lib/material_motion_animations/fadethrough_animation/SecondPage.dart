import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/About.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/Inbox.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key, required this.ScreenToShow,});

  final String ScreenToShow;

  @override
  Widget build(BuildContext context) {
    return switch (ScreenToShow) {
      "Inbox" => Inbox(),
      "About" => About(),
      _ => throw(Exception())
    };
  }
}
