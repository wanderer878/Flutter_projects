import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/Screen2.dart';
import 'package:flutter_practices/material_motion_animations/shared_axis_transition/route.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 1'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, Shared_axis_navigator().route(Screen2()));
              },
              child: Text('Screen 2 (w/o Page extend)'),
            ),
          ],
        ),
      ),
    );
  }
}
