part of api.api;

class SignUpModel {
  
  String email = null;
  
  String name = null;
  
  int genderId = null;
  
  DateTime dateBirthday = null;
  
  String password = null;
  
  String color = null;
  SignUpModel();

  @override
  String toString() {
    return 'SignUpModel[email=$email, name=$name, genderId=$genderId, dateBirthday=$dateBirthday, password=$password, color=$color, ]';
  }

  SignUpModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    name = json['name'];
    genderId = json['genderId'];
    dateBirthday = (json['dateBirthday'] == null) ?
      null :
      DateTime.parse(json['dateBirthday']);
    password = json['password'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (email != null)
      json['email'] = email;
    if (name != null)
      json['name'] = name;
    if (genderId != null)
      json['genderId'] = genderId;
    if (dateBirthday != null)
      json['dateBirthday'] = dateBirthday == null ? null : dateBirthday.toUtc().toIso8601String();
    if (password != null)
      json['password'] = password;
    if (color != null)
      json['color'] = color;
    return json;
  }

  static List<SignUpModel> listFromJson(List<dynamic> json) {
    return json == null ? List<SignUpModel>() : json.map((value) => SignUpModel.fromJson(value)).toList();
  }

  static Map<String, SignUpModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SignUpModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SignUpModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SignUpModel-objects as value to a dart map
  static Map<String, List<SignUpModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SignUpModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SignUpModel.listFromJson(value);
       });
     }
     return map;
  }
}

