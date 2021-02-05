import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static const String userKey = 'user_details_key';

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance;
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
  }

  String get user => _getFromDisk(userKey) ?? null;

  set user(String content) {
    _saveToDisk(userKey, content);
  }
}
