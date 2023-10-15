import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/home.dart';

late final Favourites favourites;

Widget createHomeScreen() => ChangeNotifierProvider<Favourites>(
      create: (context) {
        favourites = Favourites();
        return favourites;
      },
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void addItems(int i) {
  favourites.add(i);
}

void main() {
  testWidgets("Home Page Widget Tests", (widgetTester) async {
    await widgetTester.pumpWidget(createHomeScreen());

    expect(find.byType(ListView), findsOneWidget);

    expect(find.text("item 1"), findsOneWidget);

    await widgetTester.fling(find.byType(ListView), Offset(0, -200), 200);

    await widgetTester.pumpAndSettle();

    expect(find.text('item 1'), findsNothing);
  });

  testWidgets("Testing IconButtons", (widgetTester) async {
    await widgetTester.pumpWidget(createHomeScreen());

    expect(find.byIcon(Icons.favorite), findsNothing);

    await widgetTester.tap(find.byIcon(Icons.favorite_border).first);

    await widgetTester.pumpAndSettle();

    expect(find.text('Item Added Sucessfully'), findsOneWidget);

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets("with unit testing", (widgetTester) async {
    await widgetTester.pumpWidget(createHomeScreen());

    expect(find.byIcon(Icons.favorite), findsNothing);

    expect(favourites.items.length, 0);

    addItems(1);

    expect(favourites.items.length, 1);

    await widgetTester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
