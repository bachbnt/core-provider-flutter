import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Flavor { DEVELOPMENT, STAGING, PRODUCTION }
enum Platform { ANDROID, IOS, FLUTTER }

class AppConfig {
  static Flavor appFlavor;
  static Platform appPlatform;

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return '';
      case Flavor.STAGING:
        return '';
      case Flavor.PRODUCTION:
        return '';
      default:
        return '';
    }
  }

  static String get flavorName {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'DEVELOPMENT';
      case Flavor.STAGING:
        return 'STAGING';
      case Flavor.PRODUCTION:
        return 'PRODUCTION';
      default:
        return 'DEVELOPMENT';
    }
  }

  static String get platformName {
    switch (appPlatform) {
      case Platform.FLUTTER:
        return 'FLUTTER';
      case Platform.ANDROID:
        return 'ANDROID';
      case Platform.IOS:
        return 'IOS';
      default:
        return 'FLUTTER';
    }
  }

  static Color get flavorColor {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return AppColors.developmentColor;
      case Flavor.STAGING:
        return AppColors.stagingColor;
      case Flavor.PRODUCTION:
        return AppColors.productionColor;
      default:
        return AppColors.developmentColor;
    }
  }

  static Color get platformColor {
    switch (appPlatform) {
      case Platform.FLUTTER:
        return AppColors.flutterColor;
      case Platform.ANDROID:
        return AppColors.androidColor;
      case Platform.IOS:
        return AppColors.iosColor;
      default:
        return AppColors.flutterColor;
    }
  }

  static bool isDevelopment() => appFlavor == Flavor.DEVELOPMENT;

  static bool isStaging() => appFlavor == Flavor.STAGING;

  static bool isProduction() => appFlavor == Flavor.PRODUCTION;

  static bool isAndroid() => appPlatform == Platform.ANDROID;

  static bool isIOS() => appPlatform == Platform.IOS;

  static bool isFlutter() => appPlatform == Platform.FLUTTER;
}
