import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class Settings {
  String culture;

  static String localStorageKey = "settings_state";

  Settings({this.culture});

  Settings.fromJson(Map<String, dynamic> json) {
    culture = json['culture'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['culture'] = culture;
    return json;
  }

  static Settings fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Settings.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Settings model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
