part of api.api;

class GenderTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  int baseEntityId = null;
  
  Gender baseEntity = null;
  GenderTranslation();

  @override
  String toString() {
    return 'GenderTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  GenderTranslation.fromJson(Map<String, dynamic> json) {
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
      Gender.fromJson(json['baseEntity']);
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

  static List<GenderTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<GenderTranslation>() : json.map((value) => GenderTranslation.fromJson(value)).toList();
  }

  static Map<String, GenderTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, GenderTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = GenderTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of GenderTranslation-objects as value to a dart map
  static Map<String, List<GenderTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<GenderTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = GenderTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

