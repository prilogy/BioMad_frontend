part of api.api;

class RefreshTokenAuthenticationModel {
  
  String refreshToken = null;
  /* Id of current user */
  int userId = null;
  /* Id of current member */
  int memberId = null;
  RefreshTokenAuthenticationModel({this.refreshToken, this.userId, this.memberId});

  @override
  String toString() {
    return 'RefreshTokenAuthenticationModel[refreshToken=$refreshToken, userId=$userId, memberId=$memberId, ]';
  }

  RefreshTokenAuthenticationModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    refreshToken = json['refreshToken'];
    userId = json['userId'];
    memberId = json['memberId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (refreshToken != null)
      json['refreshToken'] = refreshToken;
    if (userId != null)
      json['userId'] = userId;
    if (memberId != null)
      json['memberId'] = memberId;
    return json;
  }

  static List<RefreshTokenAuthenticationModel> listFromJson(List<dynamic> json) {
    return json == null ? List<RefreshTokenAuthenticationModel>() : json.map((value) => RefreshTokenAuthenticationModel.fromJson(value)).toList();
  }

  static Map<String, RefreshTokenAuthenticationModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RefreshTokenAuthenticationModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = RefreshTokenAuthenticationModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RefreshTokenAuthenticationModel-objects as value to a dart map
  static Map<String, List<RefreshTokenAuthenticationModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<RefreshTokenAuthenticationModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = RefreshTokenAuthenticationModel.listFromJson(value);
       });
     }
     return map;
  }
}

