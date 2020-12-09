part of api.api;

class BiomarkerTranslation {
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  int cultureId = null;
  BiomarkerTranslation();

  @override
  String toString() {
    return 'BiomarkerTranslation[name=$name, description=$description, baseEntityId=$baseEntityId, cultureId=$cultureId, ]';
  }

  BiomarkerTranslation.fromJson(Map<String, dynamic> json) {
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

  static List<BiomarkerTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerTranslation>() : json.map((value) => BiomarkerTranslation.fromJson(value)).toList();
  }

  static Map<String, BiomarkerTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerTranslation-objects as value to a dart map
  static Map<String, List<BiomarkerTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

