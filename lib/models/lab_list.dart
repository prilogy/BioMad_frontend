import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class LabList {
  List<Lab>? labs;
  DateTime? lastUpdateDate;

  static String localStorageKey = "labs_state";

  LabList({this.labs});

  LabList.fromJson(Map<String, dynamic> json) {
    labs = (json['labs'] == null)
        ? null
        : Lab.listFromJson(json['labs']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['labs'] = labs;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
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
