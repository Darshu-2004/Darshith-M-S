import "package:shared_preferences/shared_preferences.dart";
import "package:flutter/material.dart";

class SharedPreferencesMan {
  late SharedPreferences _late;

  static final SharedPreferencesMan i = SharedPreferencesMan._internal();

  SharedPreferencesMan._internal();

  factory SharedPreferencesMan() {
    return i;
  }
  // Initialize SharedPreferences asynchronously
  Future<void> init() async {
    _late = await _initPrefs();
  }

  // Private method to initialize SharedPreferences
  Future<SharedPreferences> _initPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setappFirstOpen(bool b) async {
    await _late.setBool("first", b);
  }

  bool getappFirstOpen() {
    return _late.getBool("first") ?? false;
  }
}

//1205
// await is akeyword can only be used in async