part of api.api;

class Culture {
  
  int id = null;
  
  String key = null;
  
  String name = null;
  Culture();

  @override
  String toString() {
    return 'Culture[id=$id, key=$key, name=$name, ]';
  }

  Culture.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['key'] = key;
      json['name'] = name;
    return json;
  }

  static List<Culture> listFromJson(List<dynamic> json) {
    return json == null ? List<Culture>() : json.map((value) => Culture.fromJson(value)).toList();
  }

  static Map<String, Culture> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Culture>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Culture.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Culture-objects as value to a dart map
  static Map<String, List<Culture>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Culture>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Culture.listFromJson(value);
       });
     }
     return map;
  }
}

