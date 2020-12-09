part of api.api;

class BiomarkerTypeTranslation {
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  BiomarkerType baseEntity = null;
  
  int cultureId = null;
  BiomarkerTypeTranslation();

  @override
  String toString() {
    return 'BiomarkerTypeTranslation[name=$name, description=$description, baseEntityId=$baseEntityId, baseEntity=$baseEntity, cultureId=$cultureId, ]';
  }

  BiomarkerTypeTranslation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    baseEntityId = json['baseEntityId'];
    baseEntity = (json['baseEntity'] == null) ?
      null :
      BiomarkerType.fromJson(json['baseEntity']);
    cultureId = json['cultureId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
      json['description'] = description;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (baseEntity != null)
      json['baseEntity'] = baseEntity;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    return json;
  }

  static List<BiomarkerTypeTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerTypeTranslation>() : json.map((value) => BiomarkerTypeTranslation.fromJson(value)).toList();
  }

  static Map<String, BiomarkerTypeTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerTypeTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerTypeTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerTypeTranslation-objects as value to a dart map
  static Map<String, List<BiomarkerTypeTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerTypeTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerTypeTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

