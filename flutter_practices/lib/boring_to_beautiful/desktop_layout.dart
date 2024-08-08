import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practices/boring_to_beautiful/GridviewScreen.dart';
import 'package:flutter_practices/boring_to_beautiful/Searchpage.dart';
import 'package:flutter_practices/boring_to_beautiful/select_provider.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/custom_Navigator/SearchPage.dart';
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
            //extended: widget.constraints.width >= 700 ? true : false,
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
            0 => Gridviewscreen(),
            1 => Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SearchPage()));
                    },
                    child: Text('Go to search')),
              ),
            2 => Text('Profile'),
            _ => throw Exception()
          },
        ))
      ],
    );
  }
}
