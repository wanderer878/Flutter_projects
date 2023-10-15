import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/favourites.dart';

late final Favourites favorites;

Widget createFavouritesScreen() => ChangeNotifierProvider(
      create: (context) {
        favorites = Favourites();

        return favorites;
      },
      child: const MaterialApp(
        home: FavoritesPage(),
      ),
    );

void add_item() {
  for (var i = 0; i < 10; i++) {
    favorites.add(i);
  }
}

void main() {
  group('favorite screen test', () {
    testWidgets('adding and removing fav', (widgetTester) async {
      await widgetTester.pumpWidget(createFavouritesScreen());
      add_item();
      await widgetTester.pumpAndSettle();
      expect(find.text('Item 0'), findsOneWidget);
      await widgetTester.tap(find.byIcon(Icons.close).first);
      await widgetTester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
      expect(find.text('Item Removed From Favorites'), findsOneWidget);
    });
  });
}
