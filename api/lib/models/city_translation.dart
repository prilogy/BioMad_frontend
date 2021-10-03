part of api.api;

class CityTranslation {
  
  String? name = null;
  
  int? baseEntityId = null;
  
  City? baseEntity = null;
  
  int? cultureId = null;
  CityTranslation();

  @override
  String toString() {
    return 'CityTranslation[name=$name, baseEntityId=$baseEntityId, baseEntity=$baseEntity, cultureId=$cultureId, ]';
  }

  CityTranslation.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    baseEntityId = json['baseEntityId'];
    baseEntity = (json['baseEntity'] == null) ?
      null :
      City.fromJson(json['baseEntity']);
    cultureId = json['cultureId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (baseEntity != null)
      json['baseEntity'] = baseEntity;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    return json;
  }

  static List<CityTranslation> listFromJson(List<dynamic> json) {
    return json == null ? <CityTranslation>[] : json.map((value) => CityTranslation.fromJson(value)).toList();
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

