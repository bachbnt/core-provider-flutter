import 'package:bach_flutter_app/views/cupertino/ios_forgot_password_view.dart';
import 'package:bach_flutter_app/views/cupertino/ios_main_view.dart';
import 'package:bach_flutter_app/views/cupertino/ios_setting_view.dart';
import 'package:bach_flutter_app/views/cupertino/ios_sign_in_view.dart';
import 'package:bach_flutter_app/views/cupertino/ios_sign_up_view.dart';
import 'package:bach_flutter_app/views/material/android_forgot_password_view.dart';
import 'package:bach_flutter_app/views/material/android_main_view.dart';
import 'package:bach_flutter_app/views/material/android_sign_in_view.dart';
import 'package:bach_flutter_app/views/material/android_sign_up_view.dart';
import 'package:bach_flutter_app/views/material/android_setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String initialRoute = '/';
const String signInRoute = '/sign_in';
const String signUpRoute = '/sign_up';
const String forgotPasswordRoute = '/forgot_password';
const String mainRoute = '/main';
const String settingRoute = '/setting';

class MaterialAppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AndroidSignInView());
      case signInRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AndroidSignInView());
      case signUpRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AndroidSignUpView());
      case forgotPasswordRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AndroidForgotPasswordView());
      case mainRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AndroidMainView());
      case settingRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AndroidSettingView());
      default:
        return MaterialPageRoute<dynamic>(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          );
        });
    }
  }
}

class CupertinoAppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (_) => IOSSignInView());
      case signInRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (_) => IOSSignInView());
      case signUpRoute:
        return CupertinoPageRoute<dynamic>(builder: (_) => IOSSignUpView());
      case forgotPasswordRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (_) => IOSForgotPasswordView());
      case mainRoute:
        return CupertinoPageRoute<dynamic>(builder: (_) => IOSMainView());
      case settingRoute:
        return CupertinoPageRoute<dynamic>(builder: (_) => IOSSettingView());
      default:
        return CupertinoPageRoute<dynamic>(builder: (_) {
          return CupertinoPageScaffold(
            child: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          );
        });
    }
  }
}
