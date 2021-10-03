part of api.api;

class GenderTranslation {
  
  String? name = null;
  
  int? baseEntityId = null;
  
  int? cultureId = null;
  GenderTranslation();

  @override
  String toString() {
    return 'GenderTranslation[name=$name, baseEntityId=$baseEntityId, cultureId=$cultureId, ]';
  }

  GenderTranslation.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    baseEntityId = json['baseEntityId'];
    cultureId = json['cultureId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    return json;
  }

  static List<GenderTranslation> listFromJson(List<dynamic> json) {
    return json == null ? <GenderTranslation>[] : json.map((value) => GenderTranslation.fromJson(value)).toList();
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

