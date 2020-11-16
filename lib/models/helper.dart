import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class Helper {
  List<Gender> genders;
  List<Gender> cultures;

  // TODO: add cultures

  static String localStorageKey = "helper_state";

  Helper({this.genders});

  Helper.fromJson(Map<String, dynamic> json) {
    genders =
    (json['genders'] == null) ? null : Gender.listFromJson(json['genders']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['genders'] = genders;
    return json;
  }

  static Helper fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Helper.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Helper model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
