part of api.api;

class UnitTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  int baseEntityId = null;
  
  Unit baseEntity = null;
  UnitTranslation();

  @override
  String toString() {
    return 'UnitTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  UnitTranslation.fromJson(Map<String, dynamic> json) {
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
      Unit.fromJson(json['baseEntity']);
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

  static List<UnitTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<UnitTranslation>() : json.map((value) => UnitTranslation.fromJson(value)).toList();
  }

  static Map<String, UnitTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UnitTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = UnitTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UnitTranslation-objects as value to a dart map
  static Map<String, List<UnitTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<UnitTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = UnitTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

