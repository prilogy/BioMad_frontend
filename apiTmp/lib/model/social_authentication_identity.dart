part of api.api;

class SocialAuthenticationIdentity {
  
  String id = null;
  
  String name = null;
  
  String email = null;
  SocialAuthenticationIdentity();

  @override
  String toString() {
    return 'SocialAuthenticationIdentity[id=$id, name=$name, email=$email, ]';
  }

  SocialAuthenticationIdentity.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['id'] = id;
      json['name'] = name;
      json['email'] = email;
    return json;
  }

  static List<SocialAuthenticationIdentity> listFromJson(List<dynamic> json) {
    return json == null ? List<SocialAuthenticationIdentity>() : json.map((value) => SocialAuthenticationIdentity.fromJson(value)).toList();
  }

  static Map<String, SocialAuthenticationIdentity> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SocialAuthenticationIdentity>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SocialAuthenticationIdentity.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SocialAuthenticationIdentity-objects as value to a dart map
  static Map<String, List<SocialAuthenticationIdentity>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SocialAuthenticationIdentity>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SocialAuthenticationIdentity.listFromJson(value);
       });
     }
     return map;
  }
}

