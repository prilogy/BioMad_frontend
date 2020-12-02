part of api.api;

class CityTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  int baseEntityId = null;
  
  City baseEntity = null;
  CityTranslation();

  @override
  String toString() {
    return 'CityTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  CityTranslation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    cultureId = json['cultureId'];
    culture = (json['culture'] == null) ?
      null :
      Culture.fromJson(json['culture']);
    name = json['name'];
    baseEntityId = json['baseEntityId'];
    baseEntity = (json['baseEntity'] == null) ?
      null :
      City.fromJson(json['baseEntity']);
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
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (baseEntity != null)
      json['baseEntity'] = baseEntity;
    return json;
  }

  static List<CityTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<CityTranslation>() : json.map((value) => CityTranslation.fromJson(value)).toList();
  }

  static Map<String, CityTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CityTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CityTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CityTranslation-objects as value to a dart map
  static Map<String, List<CityTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CityTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CityTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

