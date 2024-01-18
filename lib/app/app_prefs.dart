import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'languages_manager.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyIsLoggedIn = "prefsKeyIsLoggedIn";
const String prefsKeyOnBoarding = "prefsKeyOnBoarding";
const String cameraPositionKey = "lastCameraPosition";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> deleteUserLogin() async {
    _sharedPreferences.setBool(prefsKeyIsLoggedIn, false);
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.ARABIC.getValue());
    }
  }

  Future<String?> getToken({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setToken({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }
  Future<String?> getProfilePicture({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setProfilePicture({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }

  Future<String?> getUserId({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setUserId({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }

  Future<String?> getFirstName({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setFirstName({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }
  Future<String?> getLastName({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setLastName({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }

  Future<String?> getUserEmail({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setUserEmail({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }

  Future<String?> getPhoneNumber({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setLocationId({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }

  Future<String?> getLocationId({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setPhoneNumber({
    required var key,
    required String value,
  }) async {
    _sharedPreferences.setString(key, value);
  }

  Future<Locale> getLocale() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCALE;
    } else {
      return ENGLISH_LOCALE;
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnBoarding, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnBoarding) ?? false;
  }

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsLoggedIn) ?? false;
  }
}
