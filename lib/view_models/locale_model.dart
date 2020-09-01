import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  static const List<Locale> locales = [Locale('en'), Locale('vi')];
  Locale currentLocale = Locale('en');

  void toggleLocale(Locale newLocale) {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    notifyListeners();
  }
}
