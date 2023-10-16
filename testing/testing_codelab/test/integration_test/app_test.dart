import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_codelab/main.dart';

void main() {
  testWidgets("Favorites operations test", (widgetTester) async {
    await widgetTester.pumpWidget(MainApp());

    final icon_Keys = ["icon_0", "icon_1", "icon_2"];

    for (var icon in icon_Keys) {
      await widgetTester.tap(find.byKey(Key(icon)));
      await widgetTester.pumpAndSettle();
      expect(find.text("Item Added Sucessfully"), findsOneWidget);
    }

    await widgetTester.tap(find.text("Favorite"));

    await widgetTester.pumpAndSettle();

    expect(find.byIcon(Icons.close), findsAtLeastNWidgets(1));

    final remove_icon_Keys = [
      "remove_icon_0",
      "remove_icon_1"
          "remove_icon_2"
    ];

    for (var remove_icon in remove_icon_Keys) {
      await widgetTester.tap(find.byKey(Key(remove_icon)));
      await widgetTester.pumpAndSettle();
      expect(find.text("Item Removed From Favorites"), findsOneWidget);
    }
  });
}
