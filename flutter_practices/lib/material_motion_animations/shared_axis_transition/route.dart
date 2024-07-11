import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Shared_axis_navigator {
  Route route(Widget screen) => PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          fillColor: Colors.black,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      });
}

class SharedAxisPageWrapper extends Page {
  final Widget screen;
  final ValueKey transitionKey;

  SharedAxisPageWrapper(
      {super.key,
      super.name,
      super.arguments,
      super.restorationId,
      required this.screen,
      required this.transitionKey});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => screen);
  }
}
