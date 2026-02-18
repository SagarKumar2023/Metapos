import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/SharedPrefsKeys.dart';
import 'Prefs.dart';
// ignore: avoid_classes_with_only_static_members
class PrefUtils {

  static bool isUserLoggedIn() {
    return Prefs.prefs!.getBool(SharedPrefsKeys.USER_LOGGED_IN) ?? false;
  }

  static Future<void> setUserLoggedIn(bool value) async {
    await Prefs.prefs!.setBool(SharedPrefsKeys.USER_LOGGED_IN, value);
  }

  static String? setUserName(String id) {
    Prefs.prefs?.setString(Prefs.username, id);
  }

  static String getUserName() {
    final String? value = Prefs.prefs?.getString(Prefs.username);
    return value ?? '';
  }

  static String? setEmail(String email) {
    Prefs.prefs?.setString(Prefs.userEmail, email);
  }

  static String getEmail() {
    final String? value = Prefs.prefs?.getString(Prefs.userEmail);
    return value ?? '';
  }

  static String? setUserPhone(String phone) {
    Prefs.prefs?.setString(Prefs.userPhone, phone);
  }

  static String getUserPhone() {
    final String? value = Prefs.prefs?.getString(Prefs.userPhone);
    return value ?? '';
  }


  static String? setUserId(String id) {
    Prefs.prefs?.setString(Prefs.userId, id);
  }

  static String getUserId() {
    final String? value = Prefs.prefs?.getString(Prefs.userId);
    return value ?? '';
  }

  static String? setToken(String id) {
    Prefs.prefs?.setString(Prefs.api_token, id);
  }

  static String getToken() {
    final String? value = Prefs.prefs?.getString(Prefs.api_token);
    return value ?? '';
  }

  static String? setFcmToken(String id) {
    Prefs.prefs?.setString(Prefs.fcmToken, id);
  }
  static String getFcmToken() {
    final String? value = Prefs.prefs?.getString(Prefs.fcmToken);
    return value ?? '';
  }


  static String getUserToken() {
    final String? value = Prefs.prefs?.getString(Prefs.userId);
    return value ?? '';
  }

  static String? setIntro(bool intro) {
    Prefs.prefs?.setBool(Prefs.isIntro, intro);
  }
  static void removeUserToken(){
    Prefs.prefs?.remove(Prefs.userId);
  }
  static bool containUserKey(){
    final bool? value = Prefs.prefs?.containsKey(Prefs.userId);
    print("userkey ${value.toString()}");
    return value ?? false;
  }

  static bool getIntro() {
    final bool? value = Prefs.prefs?.getBool(Prefs.isIntro);
    return value ?? false;
  }

  static String? logout() {
    Prefs.prefs?.clear();
  }
}
