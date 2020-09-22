import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Flavor { DEVELOPMENT, STAGING, PRODUCTION }
enum Design { MATERIAL, CUPERTINO }

class AppConfig {
  static Flavor appFlavor;
  static Design appDesign;

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

  static String get designName {
    switch (appDesign) {
      case Design.MATERIAL:
        return 'MATERIAL';
      case Design.CUPERTINO:
        return 'CUPERTINO';
      default:
        return 'MATERIAL';
    }
  }

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

  static Color get flavorColor {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return AppColors.failureColor;
      case Flavor.STAGING:
        return AppColors.warningColor;
      case Flavor.PRODUCTION:
        return AppColors.successColor;
      default:
        return AppColors.failureColor;
    }
  }

  static bool isDev() => appFlavor == Flavor.DEVELOPMENT;

  static bool isStaging() => appFlavor == Flavor.STAGING;

  static bool isProduction() => appFlavor == Flavor.PRODUCTION;

  static bool isMaterial() => appDesign == Design.MATERIAL;

  static bool isCupertino() => appDesign == Design.CUPERTINO;
}
