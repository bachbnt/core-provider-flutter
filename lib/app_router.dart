import 'package:bach_flutter_app/views/forgot_password_view.dart';
import 'package:bach_flutter_app/views/main_view.dart';
import 'package:bach_flutter_app/views/sign_in_view.dart';
import 'package:bach_flutter_app/views/sign_up_view.dart';
import 'package:bach_flutter_app/views/settings_view.dart';
import 'package:flutter/material.dart';

const String initialRoute = '/';
const String signInRoute = '/signin';
const String signUpRoute = '/signup';
const String forgotPasswordRoute = '/forgot_password';
const String mainRoute = '/main';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => SignInView());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignInView());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text(
                    'No route defined for ${settings.name}',
                  ),
                )));
    }
  }
}
