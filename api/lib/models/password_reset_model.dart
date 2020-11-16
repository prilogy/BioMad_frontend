part of api.api;

class PasswordResetModel {
  
  String code = null;
  
  String password = null;
  PasswordResetModel();

  @override
  String toString() {
    return 'PasswordResetModel[code=$code, password=$password, ]';
  }

  PasswordResetModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code = json['code'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (code != null)
      json['code'] = code;
    if (password != null)
      json['password'] = password;
    return json;
  }

  static List<PasswordResetModel> listFromJson(List<dynamic> json) {
    return json == null ? List<PasswordResetModel>() : json.map((value) => PasswordResetModel.fromJson(value)).toList();
  }

  static Map<String, PasswordResetModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PasswordResetModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = PasswordResetModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of PasswordResetModel-objects as value to a dart map
  static Map<String, List<PasswordResetModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<PasswordResetModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = PasswordResetModel.listFromJson(value);
       });
     }
     return map;
  }
}

