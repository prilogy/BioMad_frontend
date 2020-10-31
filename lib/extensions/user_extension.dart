import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

extension UserExtension on User {
  static String localStorageKey = "user_state";

  static User fromLocalStorage() {
    var json = localStorage.getItem(UserExtension.localStorageKey);
    return json == null ? null : User.fromJson(json);
  }

  static void saveToLocalStorage(User user) {
    localStorage.setItem(UserExtension.localStorageKey, user.toJson());
  }
}