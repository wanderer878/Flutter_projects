import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/boring_to_beautiful/select_provider.dart';
import 'package:provider/provider.dart';

class DesktopLayout extends StatefulWidget {
  DesktopLayout({super.key, required this.constraints});

  BoxConstraints constraints;

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  void changeDestination(int selected_index) {
    setState(() {
      Provider.of<SelectProvider>(context, listen: false)
          .ChangeSelectedIndex(selected_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
            extended: widget.constraints.maxWidth >= 700 ? true : false,
            onDestinationSelected: changeDestination,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.search), label: Text('Search')),
              NavigationRailDestination(
                  icon: Icon(Icons.person), label: Text('Profile'))
            ],
            selectedIndex: Provider.of<SelectProvider>(context, listen: false)
                .selectedindex),
        Expanded(
            child: Center(
          child: switch (Provider.of<SelectProvider>(context, listen: false)
              .selectedindex) {
            0 => Text('Home'),
            1 => Text('Search'),
            2 => Text('Profile'),
            _ => throw Exception()
          },
        ))
      ],
    );
  }
}
