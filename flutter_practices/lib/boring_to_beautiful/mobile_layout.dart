import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/boring_to_beautiful/select_provider.dart';
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
              0 => Text('home'),
              1 => Text('Search'),
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
