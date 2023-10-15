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

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets("with unit testing", (widgetTester) async {
    await widgetTester.pumpWidget(createHomeScreen());

    expect(find.byIcon(Icons.favorite), findsNothing);

    myFunction() {
      test("adding item", () {
        final favourites = Favourites();

        int i = 10;
        expect(favourites.items.length, 0);

        favourites.add(i);

        expect(favourites.items.length, 1);
      });
    }

    expect(myFunction(), equals(Favourites().items.length == 1));
  });

  /*await widgetTester.pumpAndSettle();

    xpect(find.byIcon(Icons.favorite), findsOneWidget);
  });*/
}
