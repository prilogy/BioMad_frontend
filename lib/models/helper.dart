import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class Helper {
  List<Gender>? genders;
  List<Culture>? cultures;
  DateTime? lastUpdateDate;

  static String localStorageKey = "helper_state";

  Helper({this.genders, this.cultures, this.lastUpdateDate});

  Helper.fromJson(Map<String, dynamic> json) {
    genders =
        (json['genders'] == null) ? null : Gender.listFromJson(json['genders']);
    cultures = (json['cultures'] == null)
        ? null
        : Culture.listFromJson(json['cultures']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['genders'] = genders;
    json['cultures'] = cultures;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
    return json;
  }

  static Helper fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Helper.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Helper model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
