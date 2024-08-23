import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

ThemeData _basetheme = ThemeData.light();

ThemeData baseTheme() {
  return _basetheme.copyWith(
      //canvasColor: _basetheme.colorScheme.inversePrimary,
      appBarTheme: AppBarTheme(
          color: _basetheme.primaryColor,
          titleTextStyle: TextStyle(
              color: _basetheme.colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      textTheme: _basetheme.textTheme
          .copyWith(
              bodySmall: _basetheme.textTheme.bodySmall!
                  .copyWith(fontSize: 19.0, fontStyle: FontStyle.italic))
          .apply(
              fontFamily: 'Ubuntu',
              displayColor: Colors.white,
              bodyColor: Colors.lightBlue));
}
