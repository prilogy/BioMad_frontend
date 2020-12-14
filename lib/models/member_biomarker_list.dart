import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class MemberBiomarkerList {
  List<MemberBiomarker> biomarkers = [];

  static String localStorageKey = "memberBiomarkers_state";

  MemberBiomarkerList({this.biomarkers});

  MemberBiomarkerList.fromJson(Map<String, dynamic> json) {
    biomarkers = (json['Biomarkers'] == null)
        ? null
        : MemberBiomarker.listFromJson(json['Biomarkers']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['Biomarkers'] = biomarkers;
    return json;
  }

  static MemberBiomarkerList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return MemberBiomarkerList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(MemberBiomarkerList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
