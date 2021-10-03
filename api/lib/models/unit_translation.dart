part of api.api;

class UnitTranslation {
  
  String? name = null;
  
  int? baseEntityId = null;
  
  String? shorthand = null;
  
  int? cultureId = null;
  UnitTranslation();

  @override
  String toString() {
    return 'UnitTranslation[name=$name, baseEntityId=$baseEntityId, shorthand=$shorthand, cultureId=$cultureId, ]';
  }

  UnitTranslation.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    baseEntityId = json['baseEntityId'];
    shorthand = json['shorthand'];
    cultureId = json['cultureId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
      json['shorthand'] = shorthand;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    return json;
  }

  static List<UnitTranslation> listFromJson(List<dynamic> json) {
    return json == null ? <UnitTranslation>[] : json.map((value) => UnitTranslation.fromJson(value)).toList();
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

