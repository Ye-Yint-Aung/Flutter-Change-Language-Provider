import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const lang = 'language';
  static const theme = 'theme';


  static Future<String?> getData({required String key}) async {
    final shared = await SharedPreferences.getInstance();
    final value = shared.getString(key);
    return value;
  }

  static Future<void> setData({required String key, required dynamic value}) async {
    final shared = await SharedPreferences.getInstance();
    shared.setString(key, value);
  }

  static Future<void> setBool({required String key, required bool value}) async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    final shared = await SharedPreferences.getInstance();
    final value = shared.getBool(key);
    return value;
  }
}