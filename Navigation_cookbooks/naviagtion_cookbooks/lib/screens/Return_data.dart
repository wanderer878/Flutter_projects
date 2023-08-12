import 'package:flutter/material.dart';

class return_data extends StatelessWidget {
  const return_data({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selection Screen'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'yup');
                  },
                  child: Text('yes')),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nope');
                  },
                  child: Text('no')),
            ],
          ),
        ));
  }
}
