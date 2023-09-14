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

      //final image_w = find.image(FileImage(File("images/Starfield.webp")));
      final text_finder = find.text("Widget 2");

      expect(text_finder, findsOneWidget);
    });
  });
}
