class AuthService {
  static AuthService _instance;

  static AuthService get instance {
    if (_instance == null) _instance = AuthService();
    return _instance;
  }

  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  Future<bool> signUp(String email, String password, String firstName, String lastName) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  Future<bool> resetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
