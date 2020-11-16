import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class Settings {
  List<Gender> genders;

  // TODO: add cultures

  static String localStorageKey = "settings_state";

  Settings({this.genders});

  Settings.fromJson(Map<String, dynamic> json) {
    genders =
        (json['genders'] == null) ? null : Gender.listFromJson(json['genders']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['genders'] = genders;
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
