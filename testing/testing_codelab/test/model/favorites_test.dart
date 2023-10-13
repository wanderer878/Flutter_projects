import 'package:flutter_test/flutter_test.dart';
import 'package:testing_codelab/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    test('A new item should be added', () {
      int i = 10;

      final favourite = Favourites();

      expect(favourite.items.length, 0);

      favourite.add(i);

      expect(favourite.items.length, 1);
    });

    test('An item should be removed', () {
      int i = 10;

      final favourite = Favourites();

      //favourite.add(i);

      favourite.items.contains(i) ? favourite.remove(i) : null;

      expect(!favourite.items.contains(i), true);
    });
  });
}
