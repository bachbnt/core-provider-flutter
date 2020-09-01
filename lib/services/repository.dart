import 'package:bach_flutter_app/models/user.dart';

class Repository {
  static Repository _instance;

  static Repository get instance {
    if (_instance == null) _instance = Repository();
    return _instance;
  }

  User currentUser;
}
