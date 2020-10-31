import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class Authorization {
  RefreshToken refreshToken;
  String accessToken;
  int currentMemberId;

  bool get isAuthorized => refreshToken != null && accessToken != null;

  static String localStorageKey = 'authorization_state';

  Authorization({
      this.refreshToken,
      this.accessToken,
      this.currentMemberId});


  static Authorization fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Authorization.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Authorization model) {
    print('saving to local' + model.toJson().toString());
    localStorage.setItem(localStorageKey, model.toJson());
  }

  Authorization.fromJson(Map<String, dynamic>  json) {
    refreshToken = json['refreshToken'] == null ? null : RefreshToken.fromJson(json["refreshToken"]);
    accessToken = json["accessToken"];
    currentMemberId = json["currentMemberId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["refreshToken"] = refreshToken?.toJson() ?? null;
    map["accessToken"] = accessToken;
    map["currentMemberId"] = currentMemberId;
    return map;
  }
}