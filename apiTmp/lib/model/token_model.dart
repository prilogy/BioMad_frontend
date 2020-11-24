part of api.api;

class TokenModel {
  
  String token = null;
  TokenModel();

  @override
  String toString() {
    return 'TokenModel[token=$token, ]';
  }

  TokenModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (token != null)
      json['token'] = token;
    return json;
  }

  static List<TokenModel> listFromJson(List<dynamic> json) {
    return json == null ? List<TokenModel>() : json.map((value) => TokenModel.fromJson(value)).toList();
  }

  static Map<String, TokenModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TokenModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TokenModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of TokenModel-objects as value to a dart map
  static Map<String, List<TokenModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<TokenModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = TokenModel.listFromJson(value);
       });
     }
     return map;
  }
}

