import 'package:bach_flutter_app/services/repository.dart';

class ApiService {
  static ApiService _instance;

  static ApiService get instance {
    if (_instance == null) _instance = ApiService();
    return _instance;
  }

  final Repository _repository = Repository.instance;
}
