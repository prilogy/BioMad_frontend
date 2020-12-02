part of api.api;

class Gender {
  
  int id = null;
  
  String key = null;
  
  List<GenderTranslation> translations = [];
  
  GenderTranslation content = null;
  Gender();

  @override
  String toString() {
    return 'Gender[id=$id, key=$key, translations=$translations, content=$content, ]';
  }

  Gender.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    key = json['key'];
    translations = (json['translations'] == null) ?
      null :
      GenderTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      GenderTranslation.fromJson(json['content']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['key'] = key;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
    return json;
  }

  static List<Gender> listFromJson(List<dynamic> json) {
    return json == null ? List<Gender>() : json.map((value) => Gender.fromJson(value)).toList();
  }

  static Map<String, Gender> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Gender>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Gender.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Gender-objects as value to a dart map
  static Map<String, List<Gender>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Gender>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Gender.listFromJson(value);
       });
     }
     return map;
  }
}
