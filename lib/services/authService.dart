import 'package:bach_flutter_app/models/reqres/forgotPassword.dart';
import 'package:bach_flutter_app/models/reqres/signIn.dart';
import 'package:bach_flutter_app/models/reqres/signUp.dart';

class AuthService {
  const AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService.instance() => _instance;

  Future<SignInRes> signIn(SignInReq req) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return SignInRes(status: 200);
  }

  Future<SignUpRes> signUp(SignUpReq req) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return SignUpRes(status: 200);
  }

  Future<ForgotPasswordRes> forgotPassword(ForgotPasswordReq req) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return ForgotPasswordRes(status: 200);
  }
}
