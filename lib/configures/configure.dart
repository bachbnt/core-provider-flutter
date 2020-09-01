import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Flavor { DEV, STAGING, PROD }

class Configure {
  static Flavor appFlavor;

  static String get environmentName {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'DEV';
      case Flavor.STAGING:
        return 'STAGING';
      case Flavor.PROD:
        return 'PROD';
      default:
        return 'DEV';
    }
  }

  static String get environmentEndpoint {
    switch (appFlavor) {
      case Flavor.DEV:
        return '';
      case Flavor.STAGING:
        return '';
      case Flavor.PROD:
        return '';
      default:
        return '';
    }
  }

  static Color get environmentColor {
    switch (appFlavor) {
      case Flavor.DEV:
        return AppColors.failureColor;
      case Flavor.STAGING:
        return AppColors.warningColor;
      case Flavor.PROD:
        return AppColors.successColor;
      default:
        return AppColors.failureColor;
    }
  }

  static bool isDev() => appFlavor == Flavor.DEV;

  static bool isStaging() => appFlavor == Flavor.STAGING;

  static bool isProd() => appFlavor == Flavor.PROD;
}
