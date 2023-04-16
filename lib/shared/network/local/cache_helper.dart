import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBool(
      {required String key, required bool isDarkModeActivated}) async {
    return await sharedPreferences.setBool(key, isDarkModeActivated);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
