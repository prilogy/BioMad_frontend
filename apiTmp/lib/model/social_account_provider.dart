part of api.api;

class SocialAccountProvider {
  
  int id = null;
  
  String name = null;
  SocialAccountProvider();

  @override
  String toString() {
    return 'SocialAccountProvider[id=$id, name=$name, ]';
  }

  SocialAccountProvider.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['name'] = name;
    return json;
  }

  static List<SocialAccountProvider> listFromJson(List<dynamic> json) {
    return json == null ? List<SocialAccountProvider>() : json.map((value) => SocialAccountProvider.fromJson(value)).toList();
  }

  static Map<String, SocialAccountProvider> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SocialAccountProvider>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SocialAccountProvider.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SocialAccountProvider-objects as value to a dart map
  static Map<String, List<SocialAccountProvider>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SocialAccountProvider>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SocialAccountProvider.listFromJson(value);
       });
     }
     return map;
  }
}

