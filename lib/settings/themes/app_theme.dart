import 'package:flutter/material.dart';

const List<Color> colorThemes = [
  Color(0xFF2f2c58),
  Color(0xFF0AA1FF),
  Color.fromARGB(255, 5, 255, 97),
  Color.fromARGB(255, 255, 238, 0),
  Color.fromARGB(255, 255, 166, 0),
  Color.fromARGB(255, 30, 0, 255),
  Color.fromARGB(255, 177, 0, 231),
];

class AppTheme {
  ThemeData theme(int themeChoose, List<Color> colorList) {
    return ThemeData(
        scaffoldBackgroundColor: colorThemes[themeChoose],
        useMaterial3: true,
        colorSchemeSeed: colorThemes[themeChoose]);
  }
}
