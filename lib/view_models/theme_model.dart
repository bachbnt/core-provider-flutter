import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.light();

  void toggleTheme(ThemeData newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
}
