part of api.api;

class Role {
  
  int id = null;
  
  String key = null;
  Role();

  @override
  String toString() {
    return 'Role[id=$id, key=$key, ]';
  }

  Role.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['key'] = key;
    return json;
  }

  static List<Role> listFromJson(List<dynamic> json) {
    return json == null ? List<Role>() : json.map((value) => Role.fromJson(value)).toList();
  }

  static Map<String, Role> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Role>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Role.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Role-objects as value to a dart map
  static Map<String, List<Role>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Role>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Role.listFromJson(value);
       });
     }
     return map;
  }
}

