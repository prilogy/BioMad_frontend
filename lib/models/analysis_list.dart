import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class MemberAnalysisList {
  List<MemberAnalysis>? analysis;
  DateTime? lastUpdateDate;

  static String localStorageKey = "analysis_state";

  MemberAnalysisList({this.analysis, this.lastUpdateDate});

  MemberAnalysisList.fromJson(Map<String, dynamic> json) {
    analysis = (json['MemberAnalysis'] == null)
        ? null
        : MemberAnalysis.listFromJson(json['MemberAnalysis']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['MemberAnalysis'] = analysis;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
    return json;
  }

  static MemberAnalysisList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return MemberAnalysisList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(MemberAnalysisList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
