import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/Inbox.dart';
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
              onSelected: (selected) => print('selected'),
              //Navigator.push(context, routes().createRoute(Inbox())),
              itemBuilder: (_) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Inbox',
                    child: MenuItem(),
                  ),
                  PopupMenuItem<String>(
                    value: 'About',
                    child: Icon(Icons.details),
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.mail,
        ),
        SizedBox(
          width: 5,
        ),
        Text('hello')
      ],
    );
  }
}
