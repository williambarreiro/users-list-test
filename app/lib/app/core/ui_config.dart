import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
      primaryColor: Colors.black,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black));
}
