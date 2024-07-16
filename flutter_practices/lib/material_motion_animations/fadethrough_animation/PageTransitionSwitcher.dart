import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagetransitionswitcher extends StatefulWidget {
  const Pagetransitionswitcher({super.key});

  @override
  State<Pagetransitionswitcher> createState() => _PagetransitionswitcherState();
}

class _PagetransitionswitcherState extends State<Pagetransitionswitcher> {
  bool _condition = false;
  final button_key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page transition switcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _condition = !_condition;
                  });
                },
                child: Pagetransitionswitcherwrapper(
                  child: _condition
                      ? Text(
                          "clicked",
                          key: button_key,
                        )
                      : Text(
                          "not cliked",
                        ),
                  fillcolor: Colors.transparent,
                ))
          ],
        ),
      ),
    );
  }
}

class Pagetransitionswitcherwrapper extends StatelessWidget {
  const Pagetransitionswitcherwrapper(
      {super.key, required this.child, required this.fillcolor});

  final Widget child;
  final Color fillcolor;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: Duration(seconds: 1),
      transitionBuilder: (child, Animation, secondaryAnimation) {
        /*return FadeThroughTransition(
          fillColor: fillcolor,
          animation: Animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );*/

        return SharedAxisTransition(
          animation: Animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
          fillColor: fillcolor,
        );
      },
      child: child,
    );
  }
}
