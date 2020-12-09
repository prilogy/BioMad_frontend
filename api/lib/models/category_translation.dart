part of api.api;

class CategoryTranslation {
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  int cultureId = null;
  CategoryTranslation();

  @override
  String toString() {
    return 'CategoryTranslation[name=$name, description=$description, baseEntityId=$baseEntityId, cultureId=$cultureId, ]';
  }

  CategoryTranslation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    baseEntityId = json['baseEntityId'];
    cultureId = json['cultureId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
      json['description'] = description;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    return json;
  }

  static List<CategoryTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<CategoryTranslation>() : json.map((value) => CategoryTranslation.fromJson(value)).toList();
  }

  static Map<String, CategoryTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CategoryTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CategoryTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CategoryTranslation-objects as value to a dart map
  static Map<String, List<CategoryTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CategoryTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CategoryTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

