import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String language = "ENG";

  setLanguage(String lan) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    prefs.setString("language", lan);
    language = lan;
    notifyListeners();
  }

  void changeLanguage() {
    if (language == "ARB")
      language = "ENG";
    else
      language = "ARB";
    setLanguage(language);
  }

  Future<String> getLanguage() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    if (prefs.getString("language") != null) {
      language = prefs.getString("language")!;
    }
    return language;
  }
}
