import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/boring_to_beautiful/GridviewScreen.dart';
import 'package:flutter_practices/boring_to_beautiful/Searchpage.dart';
import 'package:flutter_practices/boring_to_beautiful/select_provider.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/custom_Navigator/SearchPage.dart';
import 'package:provider/provider.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  void changetap(int index) {
    setState(() {
      Provider.of<SelectProvider>(context, listen: false)
          .ChangeSelectedIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Center(
            child: switch (Provider.of<SelectProvider>(context, listen: false)
                .selectedindex) {
              0 => Gridviewscreen(),
              1 => Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
                      child: Text('Go to search')),
                ),
              2 => Text('Profile'),
              _ => throw Exception()
            },
          )),
          BottomNavigationBar(
              currentIndex: Provider.of<SelectProvider>(context, listen: false)
                  .selectedindex,
              onTap: changetap,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ])
        ],
      ),
    );
  }
}
