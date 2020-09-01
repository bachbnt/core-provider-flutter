import 'package:bach_flutter_app/configs/env_config.dart';

enum Environment { DEV, STAGING, PROD }

class Config {
  static Environment environment;
  static EnvConfig envConfigDEV = EnvConfig(apiKey: 'DEV');
  static EnvConfig envConfigSTAGING = EnvConfig(apiKey: 'STAGING');
  static EnvConfig envConfigPROD = EnvConfig(apiKey: 'PROD');

  static String get environmentName {
    switch (environment) {
      case Environment.DEV:
        return 'DEV';
      case Environment.STAGING:
        return 'STAGING';
      case Environment.PROD:
        return 'PROD';
      default:
        return 'STAGING';
    }
  }

  static EnvConfig get envConfig {
    switch (environment) {
      case Environment.DEV:
        return envConfigDEV;
      case Environment.STAGING:
        return envConfigSTAGING;
      case Environment.PROD:
        return envConfigPROD;
      default:
        return envConfigSTAGING;
    }
  }

  static bool isDev() => environment == Environment.DEV;

  static bool isStaging() => environment == Environment.STAGING;

  static bool isProd() => environment == Environment.PROD;
}
