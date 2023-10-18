import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Hello World")),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    label: Text("Like")),
                SizedBox(
                  width: 20,
                ),
                TextButton(onPressed: () {}, child: Text("Next"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
