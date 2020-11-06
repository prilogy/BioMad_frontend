part of api.api;

class SignUpWithSocialAccountModel {
  
  String email = null;
  
  String name = null;
  
  int genderId = null;
  
  DateTime dateBirthday = null;
  
  String password = null;
  
  SocialAuthenticationIdentity identity = null;
  String color = null;


  SignUpWithSocialAccountModel({this.email, this.name, this.genderId,
      this.dateBirthday, this.password, this.identity, this.color});

  @override
  String toString() {
    return 'SignUpWithSocialAccountModel[email=$email, name=$name, genderId=$genderId, dateBirthday=$dateBirthday, password=$password, identity=$identity, color=$color ]';
  }

  SignUpWithSocialAccountModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    name = json['name'];
    genderId = json['genderId'];
    dateBirthday = (json['dateBirthday'] == null) ?
      null :
      DateTime.parse(json['dateBirthday']);
    password = json['password'];
    color = json['color'];
    identity = (json['identity'] == null) ?
      null :
      SocialAuthenticationIdentity.fromJson(json['identity']);
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
    if (identity != null)
      json['identity'] = identity;
    if(color != null)
      json['color'] = color;
    return json;
  }

  static List<SignUpWithSocialAccountModel> listFromJson(List<dynamic> json) {
    return json == null ? List<SignUpWithSocialAccountModel>() : json.map((value) => SignUpWithSocialAccountModel.fromJson(value)).toList();
  }

  static Map<String, SignUpWithSocialAccountModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SignUpWithSocialAccountModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SignUpWithSocialAccountModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SignUpWithSocialAccountModel-objects as value to a dart map
  static Map<String, List<SignUpWithSocialAccountModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SignUpWithSocialAccountModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SignUpWithSocialAccountModel.listFromJson(value);
       });
     }
     return map;
  }
}

