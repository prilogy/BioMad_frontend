part of api.api;

class LogInWithCredentialsModel {
  
  String email = null;
  
  String password = null;
  LogInWithCredentialsModel({this.email, this.password});

  @override
  String toString() {
    return 'LogInWithCredentialsModel[email=$email, password=$password, ]';
  }

  LogInWithCredentialsModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (email != null)
      json['email'] = email;
    if (password != null)
      json['password'] = password;
    return json;
  }

  static List<LogInWithCredentialsModel> listFromJson(List<dynamic> json) {
    return json == null ? List<LogInWithCredentialsModel>() : json.map((value) => LogInWithCredentialsModel.fromJson(value)).toList();
  }

  static Map<String, LogInWithCredentialsModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LogInWithCredentialsModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = LogInWithCredentialsModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LogInWithCredentialsModel-objects as value to a dart map
  static Map<String, List<LogInWithCredentialsModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<LogInWithCredentialsModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = LogInWithCredentialsModel.listFromJson(value);
       });
     }
     return map;
  }
}

