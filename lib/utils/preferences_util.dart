import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static final String _accessTokenKey = 'access_token';
  static final String _refreshTokenKey = 'refresh_token';

  static Future<bool> setAccessToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_accessTokenKey, value);
  }

  static Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey) ?? '';
  }

  static Future<bool> setRefreshToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_refreshTokenKey, value);
  }

  static Future<String> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey) ?? '';
  }

  Future<bool> setValue(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String)
      return prefs.setString(key, value);
    else if (value is int)
      return prefs.setInt(key, value);
    else if (value is double)
      return prefs.setDouble(key, value);
    else if (value is bool)
      return prefs.setBool(key, value);
    else
      return false;
  }

  static Future<dynamic> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic value = prefs.get(key) ?? null;
    return value;
  }
}
