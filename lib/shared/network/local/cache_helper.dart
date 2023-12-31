import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async {
    return SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      return value;
    });
  }

  static Future<dynamic> setCache(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  static bool? getBooleanData({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
