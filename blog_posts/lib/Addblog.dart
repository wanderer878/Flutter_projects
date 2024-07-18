import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Addbloag extends StatelessWidget {
  const Addbloag({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _titlecontroller = TextEditingController();
    TextEditingController _contentcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Blog'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _contentcontroller,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Content',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add blog logic here
                },
                child: Text('Add Blog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
