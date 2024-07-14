import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class routes {
  Route createRoute(Widget Screen) {
    return PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
            fillColor: Colors.amber,
          );
        },
        pageBuilder: (_, Animation, secondaryAnimation) => Screen);
  }
}
