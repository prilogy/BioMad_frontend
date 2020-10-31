import 'package:biomad_frontend/services/localstorage.dart';

class Settings {

  static String localStorageKey = "settings_state";

  Settings();

  Settings.fromJson(Map<String, dynamic> json) {
    /// TODO: implement
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    // TODO: implement
    return map;
  }

  static Settings fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Settings.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Settings model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}