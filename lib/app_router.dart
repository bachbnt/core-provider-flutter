import 'package:bach_flutter_app/views/cupertino/cupertino_main_view.dart';
import 'package:bach_flutter_app/views/cupertino/cupertino_sign_in_view.dart';
import 'package:bach_flutter_app/views/material/material_forgot_password_view.dart';
import 'package:bach_flutter_app/views/material/material_main_view.dart';
import 'package:bach_flutter_app/views/material/material_sign_in_view.dart';
import 'package:bach_flutter_app/views/material/material_sign_up_view.dart';
import 'package:bach_flutter_app/views/setting_view.dart';
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
        return MaterialPageRoute<dynamic>(builder: (_) => MaterialSignInView());
      case signInRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => MaterialSignInView());
      case signUpRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => SignUpView());
      case forgotPasswordRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => ForgotPasswordView());
      case mainRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => MaterialMainView());
      case settingRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => SettingView());
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
            builder: (_) => CupertinoSignInView());
      case signInRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (_) => CupertinoSignInView());
      case signUpRoute:
        return CupertinoPageRoute<dynamic>(builder: (_) => SignUpView());
      case forgotPasswordRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (_) => ForgotPasswordView());
      case mainRoute:
        return CupertinoPageRoute<dynamic>(builder: (_) => CupertinoMainView());
      case settingRoute:
        return CupertinoPageRoute<dynamic>(builder: (_) => SettingView());
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
