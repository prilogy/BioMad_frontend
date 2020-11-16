part of api.api;

class BiomarkerTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  Biomarker baseEntity = null;
  BiomarkerTranslation();

  @override
  String toString() {
    return 'BiomarkerTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, description=$description, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  BiomarkerTranslation.fromJson(Map<String, dynamic> json) {
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
      Biomarker.fromJson(json['baseEntity']);
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

