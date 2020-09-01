import 'package:bach_flutter_app/views/forgot_password_view.dart';
import 'package:bach_flutter_app/views/main_view.dart';
import 'package:bach_flutter_app/views/sign_in_view.dart';
import 'package:bach_flutter_app/views/sign_up_view.dart';
import 'package:bach_flutter_app/views/setting_view.dart';
import 'package:flutter/material.dart';

const String initialRoute = '/';
const String signInRoute = '/sign_in';
const String signUpRoute = '/sign_up';
const String forgotPasswordRoute = '/forgot_password';
const String mainRoute = '/main';
const String settingRoute = '/setting';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInView());
      case signInRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInView());
      case signUpRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => SignUpView());
      case forgotPasswordRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => ForgotPasswordView());
      case mainRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => MainView());
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
