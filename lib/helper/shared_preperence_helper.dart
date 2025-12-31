
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/local_user_model.dart';




class SharedPrefService {
  static final SharedPrefService instance = SharedPrefService._internal();

  factory SharedPrefService() => instance;

  SharedPrefService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save a LocalUser in a single key
  Future<void> saveUser(LocalUser user) async {
    if (_prefs == null) await init();
    final userJson = jsonEncode(user.toJson());
    await _prefs!.setString('firebase_user', userJson);
  }

  /// Retrieve the user
  LocalUser? getUser() {
    if (_prefs == null) return null;
    final jsonString = _prefs!.getString('firebase_user');
    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString);
    return LocalUser.fromJson(jsonMap);
  }

  /// Remove user (logout)
  Future<void> removeUser() async {
    if (_prefs == null) await init();
    await _prefs!.remove('firebase_user');
  }
}
