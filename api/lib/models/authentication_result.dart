part of api.api;

class AuthenticationResult {
  User user = null;

  RefreshToken refreshToken = null;

  String accessToken = null;

  AuthenticationResult();

  @override
  String toString() {
    return 'AuthenticationResult[user=$user, refreshToken=$refreshToken, accessToken=$accessToken, ]';
  }

  AuthenticationResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    user = (json['user'] == null) ? null : User.fromJson(json['user']);
    refreshToken = (json['refreshToken'] == null)
        ? null
        : RefreshToken.fromJson(json['refreshToken']);
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user != null) json['user'] = user;
    if (refreshToken != null) json['refreshToken'] = refreshToken;
    json['accessToken'] = accessToken;
    return json;
  }

  static List<AuthenticationResult> listFromJson(List<dynamic> json) {
    return json == null
        ? List<AuthenticationResult>()
        : json.map((value) => AuthenticationResult.fromJson(value)).toList();
  }

  static Map<String, AuthenticationResult> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, AuthenticationResult>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
          map[key] = AuthenticationResult.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of AuthenticationResult-objects as value to a dart map
  static Map<String, List<AuthenticationResult>> mapListFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, List<AuthenticationResult>>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = AuthenticationResult.listFromJson(value);
      });
    }
    return map;
  }
}
