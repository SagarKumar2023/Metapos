import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class Prefs {

  static String userId = 'user_id';
  static String api_token = 'api_token';
  static String username = 'user_name';
  static String userEmail = 'user_email';
  static String userPhone = 'user_phone';
  static String isIntro = 'intro';
  static String fcmToken = "fcmToken";
  static SharedPreferences? prefs;
  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs != null;
  }
}
