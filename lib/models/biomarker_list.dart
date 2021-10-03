import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class BiomarkerList {
  List<Biomarker>? biomarkers = [];
  DateTime? lastUpdateDate;

  static String localStorageKey = "biomarkers_state";

  BiomarkerList({this.biomarkers, this.lastUpdateDate});

  BiomarkerList.fromJson(Map<String, dynamic> json) {
    biomarkers = (json['biomarkers'] == null)
        ? null
        : Biomarker.listFromJson(json['Biomarkers']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    json['biomarkers'] = biomarkers;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
    return json;
  }

  static BiomarkerList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return BiomarkerList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(BiomarkerList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
