import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class PagetransitionSwitcherWrapper extends StatelessWidget {
  const PagetransitionSwitcherWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      child: child,
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor: Colors.transparent,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}
