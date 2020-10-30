part of api.api;

class RefreshToken {
  
  int id = null;
  
  String token = null;
  
  DateTime dateExpiration = null;
  
  bool isValid = null;
  
  int userId = null;
  
  User user = null;
  RefreshToken();

  @override
  String toString() {
    return 'RefreshToken[id=$id, token=$token, dateExpiration=$dateExpiration, isValid=$isValid, userId=$userId, user=$user, ]';
  }

  RefreshToken.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    token = json['token'];
    dateExpiration = (json['dateExpiration'] == null) ?
      null :
      DateTime.parse(json['dateExpiration']);
    isValid = json['isValid'];
    userId = json['userId'];
    user = (json['user'] == null) ?
      null :
      User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['token'] = token;
    if (dateExpiration != null)
      json['dateExpiration'] = dateExpiration == null ? null : dateExpiration.toUtc().toIso8601String();
    if (isValid != null)
      json['isValid'] = isValid;
    if (userId != null)
      json['userId'] = userId;
    if (user != null)
      json['user'] = user;
    return json;
  }

  static List<RefreshToken> listFromJson(List<dynamic> json) {
    return json == null ? List<RefreshToken>() : json.map((value) => RefreshToken.fromJson(value)).toList();
  }

  static Map<String, RefreshToken> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RefreshToken>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = RefreshToken.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RefreshToken-objects as value to a dart map
  static Map<String, List<RefreshToken>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<RefreshToken>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = RefreshToken.listFromJson(value);
       });
     }
     return map;
  }
}

