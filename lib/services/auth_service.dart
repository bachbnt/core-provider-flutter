import 'package:bach_flutter_app/services/repository.dart';

class AuthService {
  static AuthService _instance;

  static AuthService get instance {
    if (_instance == null) _instance = AuthService();
    return _instance;
  }

  final Repository _repository = Repository.instance;

  Future<bool> signIn(String email, String password) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> signUp(
      String email, String password, String firstName, String lastName) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> resetPassword(String email) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return true;
  }
}
