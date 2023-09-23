import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing/main.dart';

void main() {
  group("main text widgets test", () {
    testWidgets("MyWidget has a title and message", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: Test_widget1(title: 'T', message: 'M'),
      ));

      final title_Finder = find.text('T');
      final message_Finder = find.text('M');

      expect(title_Finder, findsOneWidget);
      expect(message_Finder, findsOneWidget);
    });

    testWidgets("New widget", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: NewWidget(),
      ));

      final new_finder = find.text("Widget 1");

      expect(new_finder, findsOneWidget);
    });

    testWidgets("Widget 2", (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(
        home: Test_widget2(),
      ));

      final image_w = find.byType(Image);
      final text_finder = find.text("Widget 2");

      expect(text_finder, findsOneWidget);
      expect(image_w, findsOneWidget);
    });
  });

  testWidgets("key widgets", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: ListView.builder(
          key: Key("12"),
          itemCount: 20,
          itemBuilder: (context, index) {
            ListTile(
              key: Key(index.toString()),
              title: Text((index).toString()),
            );
          }),
    ));

    expect(find.byKey(Key("12")), findsOneWidget);
  });

  testWidgets("finds a specific instance", (widgetTester) async {
    const txt_widget = Text("Halo 3");

    await widgetTester.pumpWidget(MaterialApp(
      home: Container(
        child: txt_widget,
      ),
    ));

    expect(find.byWidget(txt_widget), findsOneWidget);
  });

  testWidgets("Handle Scrolling", (widgetTester) async {
    final items = List<String>.generate(100, (index) => "Item $index");

    await widgetTester.pumpWidget(MaterialApp(
      home: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Text(
              items[index],
              key: Key('item_${index}_text'),
            );
          }),
    ));

    final List_Finder = find.byType(Scrollable);
    //final List_Finder = find.byKey(const ValueKey("long_list"));
    final item_to_find = find.byKey(const ValueKey("item_50_text"));

    await widgetTester.scrollUntilVisible(item_to_find, 500.0,
        scrollable: List_Finder);

    expect(item_to_find, findsOneWidget);
  });
}
