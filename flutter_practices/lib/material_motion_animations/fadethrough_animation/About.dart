import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/FirstPage.dart';
import 'package:flutter_practices/material_motion_animations/fadethrough_animation/route.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, routes().createRoute(Firstpage()));
            },
            icon: Icon(Icons.home)
          )
        ],
      ),
      body: Center(
          child: SizedBox(
            width: 150,
            child: Text(
                "Welcome to baloney1, where innovation meets excellence in worst ways. Established with a vision to redefine horrific standards, we pride ourselves on delivering horribly.",
                softWrap: true,),
          )),
    );
  }
}
