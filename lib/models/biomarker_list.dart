import 'dart:convert';

import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class BiomarkerList {
  List<Biomarker> biomarkers;

  static String localStorageKey = "biomarkers_state";

  BiomarkerList({this.biomarkers});

  BiomarkerList.fromJson(Map<String, dynamic> json) {
    biomarkers = (json['Biomarker'] == null)
        ? null
        : Biomarker.listFromJson(json['Biomarker']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['Biomarker'] = biomarkers;
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
