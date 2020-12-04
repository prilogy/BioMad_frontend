import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class LabList {
  List<Lab> labs;

  static String localStorageKey = "labs_state";

  LabList({this.labs});

  LabList.fromJson(Map<String, dynamic> json) {
    labs = (json['labs'] == null)
        ? null
        : Lab.listFromJson(json['labs']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['labs'] = labs;
    return json;
  }

  static LabList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return LabList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(LabList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
