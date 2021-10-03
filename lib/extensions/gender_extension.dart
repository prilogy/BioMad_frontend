import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

extension GenderExtension on Gender {
  static String localStorageKey = "gender_state";

  static Gender? fromLocalStorage() {
    var json = localStorage.getItem(GenderExtension.localStorageKey);
    return json == null ? null : Gender.fromJson(json);
  }

  static void saveToLocalStorage(Gender gender) {
    localStorage.setItem(GenderExtension.localStorageKey, gender.toJson());
  }
}