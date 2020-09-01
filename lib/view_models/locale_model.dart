import 'package:flutter/material.dart';

const List<Locale> supportedLocales = <Locale>[
  Locale('en'),
  Locale('zh'),
  Locale('vi')
];

const List<AppLocale> appLocales = [
  AppLocale.English,
  AppLocale.Chinese,
  AppLocale.Vietnamese
];

enum AppLocale { English, Chinese, Vietnamese }

class LocaleModel extends ChangeNotifier {
  AppLocale appLocale = AppLocale.English;
  Locale currentLocale = supportedLocales[0];

  void toggleLocale(AppLocale newAppLocale) {
    if (newAppLocale == appLocale) return;
    switch (newAppLocale) {
      case AppLocale.English:
        currentLocale = supportedLocales[0];
        break;
      case AppLocale.Chinese:
        currentLocale = supportedLocales[1];
        break;
      case AppLocale.Vietnamese:
        currentLocale = supportedLocales[2];
    }
    appLocale = newAppLocale;
    notifyListeners();
  }
}
