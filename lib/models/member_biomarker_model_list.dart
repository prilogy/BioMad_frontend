import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class MemberBiomarkerModelList {
  List<MemberBiomarkerModel> biomarkers = [];

  static String localStorageKey = "memberBiomarkerModels_state";

  MemberBiomarkerModelList({this.biomarkers});

  MemberBiomarkerModelList.fromJson(Map<String, dynamic> json) {
    biomarkers = (json['memberBiomarkerModels'] == null)
        ? null
        : MemberBiomarkerModel.listFromJson(json['memberBiomarkerModels']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['memberBiomarkerModels'] = biomarkers;
    return json;
  }

  static MemberBiomarkerModelList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return MemberBiomarkerModelList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(MemberBiomarkerModelList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
