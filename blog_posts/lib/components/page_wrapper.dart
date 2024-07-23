import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class PageWrapper extends Page {
  final Widget child;

  PageWrapper(
      {super.key,
      super.name,
      super.arguments,
      super.restorationId,
      required this.child});
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        pageBuilder: (_, Animation, secondaryAnimation) => child);
  }
}
