part of api.api;

class LabTranslation {
  
  String name = null;
  
  String description = null;
  
  int baseEntityId = null;
  
  int cultureId = null;
  LabTranslation();

  @override
  String toString() {
    return 'LabTranslation[name=$name, description=$description, baseEntityId=$baseEntityId, cultureId=$cultureId, ]';
  }

  LabTranslation.fromJson(Map<String, dynamic> json) {
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

