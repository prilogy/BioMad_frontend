part of api.api;

class CategoryTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  Category baseEntity = null;
  CategoryTranslation();

  @override
  String toString() {
    return 'CategoryTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, description=$description, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  CategoryTranslation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    cultureId = json['cultureId'];
    culture = (json['culture'] == null) ?
      null :
      Culture.fromJson(json['culture']);
    name = json['name'];
    description = json['description'];
    baseEntityId = json['baseEntityId'];
    baseEntity = (json['baseEntity'] == null) ?
      null :
      Category.fromJson(json['baseEntity']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    if (culture != null)
      json['culture'] = culture;
      json['name'] = name;
      json['description'] = description;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (baseEntity != null)
      json['baseEntity'] = baseEntity;
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

