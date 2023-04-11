import 'package:flutter/material.dart';

class Elevated_Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style = ElevatedButton.styleFrom(padding: EdgeInsets.all(16.0));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Elevated buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: null,
                child: const Text('Disabled'),
                style: style,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Enabled'))
            ],
          ),
        ));
  }
}
