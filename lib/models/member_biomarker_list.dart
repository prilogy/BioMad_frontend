import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class MemberBiomarkerList {
  List<MemberBiomarker> biomarkers = [];
  DateTime lastUpdateDate;
  bool isLoaded = true;

  static String localStorageKey = "memberBiomarkers_state";

  MemberBiomarkerList({this.biomarkers, this.isLoaded});

  MemberBiomarkerList.fromJson(Map<String, dynamic> json) {
    biomarkers = (json['memberBiomarkers'] == null)
        ? null
        : MemberBiomarker.listFromJson(json['Biomarkers']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
    isLoaded = json['isLoaded'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    json['memberBiomarkers'] = biomarkers;
    json['isLoaded'] = isLoaded;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate.toUtc().toIso8601String();
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
