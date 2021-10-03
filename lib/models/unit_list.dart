import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class UnitList {
  List<Unit>? units;
  DateTime? lastUpdateDate;

  static String localStorageKey = "units_state";

  UnitList({this.units, this.lastUpdateDate});

  UnitList.fromJson(Map<String, dynamic> json) {
    units = (json['units'] == null)
        ? null
        : Unit.listFromJson(json['units']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['units'] = units;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
    return json;
  }

  static UnitList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return UnitList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(UnitList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
