import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class BiomarkerTypeList {
  List<BiomarkerType> types;

  static String localStorageKey = "biomarkerTypes_state";

  BiomarkerTypeList({this.types});

  BiomarkerTypeList.fromJson(Map<String, dynamic> json) {
    types = (json['types'] == null)
        ? null
        : BiomarkerType.listFromJson(json['types']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['types'] = types;
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
