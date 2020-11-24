part of api.api;

class LabTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  Lab baseEntity = null;
  LabTranslation();

  @override
  String toString() {
    return 'LabTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, description=$description, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  LabTranslation.fromJson(Map<String, dynamic> json) {
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
      Lab.fromJson(json['baseEntity']);
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

  static List<LabTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<LabTranslation>() : json.map((value) => LabTranslation.fromJson(value)).toList();
  }

  static Map<String, LabTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LabTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = LabTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LabTranslation-objects as value to a dart map
  static Map<String, List<LabTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<LabTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = LabTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

