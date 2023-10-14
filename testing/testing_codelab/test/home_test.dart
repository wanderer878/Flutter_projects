import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/home.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favourites>(
      create: (context) => Favourites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  testWidgets("Home Page Widget Tests", (widgetTester) async {
    await widgetTester.pumpWidget(createHomeScreen());

    expect(find.byType(ListView), findsOneWidget);

    //await
  });
}
