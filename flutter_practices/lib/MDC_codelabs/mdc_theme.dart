import 'package:flutter/material.dart';

ThemeData _basetheme = ThemeData.light();

ThemeData baseTheme() {
  return _basetheme.copyWith(
      textTheme: _basetheme.textTheme
          .copyWith(
              bodySmall: _basetheme.textTheme.bodySmall!
                  .copyWith(fontSize: 19.0, fontStyle: FontStyle.italic))
          .apply(
              fontFamily: 'Ubuntu',
              displayColor: Colors.blue,
              bodyColor: Colors.lightBlue));
}
