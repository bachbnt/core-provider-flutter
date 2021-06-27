import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/views/forgotPasswordView.dart';
import 'package:bach_flutter_app/views/homeView.dart';
import 'package:bach_flutter_app/views/settingView.dart';
import 'package:bach_flutter_app/views/signInView.dart';
import 'package:bach_flutter_app/views/signUpView.dart';
import 'package:flutter/material.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.initial:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInView());
      case RouteName.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInView());
      case RouteName.signUp:
        return MaterialPageRoute<dynamic>(builder: (_) => SignUpView());
      case RouteName.forgotPassword:
        return MaterialPageRoute<dynamic>(builder: (_) => ForgotPasswordView());
      case RouteName.home:
        return MaterialPageRoute<dynamic>(builder: (_) => MainView());
      case RouteName.setting:
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
