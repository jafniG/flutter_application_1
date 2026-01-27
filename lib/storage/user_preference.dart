import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static const _storageKey = 'user_pref';

  static Future<bool> saveUserData(bool value) async {
    final instance = await SharedPreferences.getInstance();
    return await instance.setBool(_storageKey, value);
  }

  static Future<bool?> getUserData() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool(_storageKey);
  }

  static Future<bool> clearUserData() async {
    final instance = await SharedPreferences.getInstance();
    return await instance.remove(_storageKey);
  }

  static Future<bool> checkExistingUser() async {
    Future.delayed(Duration(seconds: 4));
    final val = await getUserData();
    if (val == null) {
      return false;
    }
    return val;
  }
}
