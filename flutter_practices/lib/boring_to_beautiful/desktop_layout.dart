import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  int index = 0;

  void changeDestination(int selected_index) {
    setState(() {
      index = selected_index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
            onDestinationSelected: changeDestination,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.ac_unit), label: Text('Ac-Unit')),
            ],
            selectedIndex: index),
        Expanded(
            child: Center(
          child: switch (index) {
            0 => Text('Home'),
            1 => Text('AC unit'),
            _ => throw Exception()
          },
        ))
      ],
    );
  }
}
