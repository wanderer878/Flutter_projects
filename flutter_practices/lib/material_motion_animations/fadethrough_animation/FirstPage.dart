import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/SecondPage.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/route.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page (Fade through)'),
        actions: [
          PopupMenuButton(
              onSelected: (selected) =>
              Navigator.pushReplacement(context, routes().createRoute(Secondpage(ScreenToShow: selected))),
              itemBuilder: (_) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Inbox',
                    child: MenuItem(icon: Icons.mail,label: "inbox",),
                  ),
                  PopupMenuItem<String>(
                    value: 'About',
                    child: MenuItem(icon: Icons.info, label: "about"),
                  ),
                ];
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'First Page',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key, required this.icon, required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon
        ),
        SizedBox(
          width: 5,
        ),
        Text(label)
      ],
    );
  }
}
