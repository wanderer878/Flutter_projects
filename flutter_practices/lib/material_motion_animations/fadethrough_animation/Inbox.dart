import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/FirstPage.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/route.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inbox"),actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, routes().createRoute(Firstpage()));
            },
            icon: Icon(Icons.home)
          )
        ],),
      body: Center(
      child: Text("no mail to show")
    ),
    ); 
  }
}