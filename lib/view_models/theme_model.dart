import 'package:bach_flutter_app/configures/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppTheme { Light, Dark }

class ThemeModel extends ChangeNotifier {
  AppTheme appTheme = AppTheme.Light;
  ThemeData materialCurrentTheme = ThemeData();
  CupertinoThemeData cupertinoCurrentTheme = CupertinoThemeData();

  void toggleTheme(AppTheme newAppTheme) {
    if (newAppTheme == appTheme) return;
    switch (newAppTheme) {
      case AppTheme.Light:
        if (AppConfig.isIOS())
          cupertinoCurrentTheme =
              CupertinoThemeData(brightness: Brightness.light);
        else
          materialCurrentTheme = ThemeData(brightness: Brightness.light);
        break;
      case AppTheme.Dark:
        if (AppConfig.isIOS())
          cupertinoCurrentTheme =
              CupertinoThemeData(brightness: Brightness.dark);
        else
          materialCurrentTheme = ThemeData(brightness: Brightness.dark);
        break;
    }
    appTheme = newAppTheme;
    notifyListeners();
  }
}
