class ApiService {
  static ApiService _instance;

  static ApiService get instance {
    if (_instance == null) _instance = ApiService();
    return _instance;
  }
}
