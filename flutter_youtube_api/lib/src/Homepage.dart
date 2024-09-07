import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go('/details');
                },
                child: Text("Details Page"))
          ],
        ),
      ),
    );
  }
}
