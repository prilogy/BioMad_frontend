part of api.api;

class BiomarkerTypeTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  BiomarkerType baseEntity = null;
  BiomarkerTypeTranslation();

  @override
  String toString() {
    return 'BiomarkerTypeTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, description=$description, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  BiomarkerTypeTranslation.fromJson(Map<String, dynamic> json) {
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
      BiomarkerType.fromJson(json['baseEntity']);
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

