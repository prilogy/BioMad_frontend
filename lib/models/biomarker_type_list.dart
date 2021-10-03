import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class BiomarkerTypeList {
  List<BiomarkerType>? types;
  DateTime? lastUpdateDate;

  static String localStorageKey = "biomarkerTypes_state";

  BiomarkerTypeList({this.types, this.lastUpdateDate});

  BiomarkerTypeList.fromJson(Map<String, dynamic> json) {
    types = (json['types'] == null)
        ? null
        : BiomarkerType.listFromJson(json['types']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['types'] = types;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
    return json;
  }

  static BiomarkerTypeList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return BiomarkerTypeList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(BiomarkerTypeList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
