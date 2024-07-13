import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.callback});
  final Function callback;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Home Page",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        callback();
      }, child: const Icon(Icons.search),),
    );
  }
}