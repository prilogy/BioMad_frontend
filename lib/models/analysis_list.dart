import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class MemberAnalysisList {
  List<MemberAnalysis> analysis;

  static String localStorageKey = "analysis_state";

  MemberAnalysisList({this.analysis});

  MemberAnalysisList.fromJson(Map<String, dynamic> json) {
    analysis = (json['MemberAnalysis'] == null)
        ? null
        : MemberAnalysis.listFromJson(json['MemberAnalysis']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['MemberAnalysis'] = analysis;
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
