part of api.api;

class Lab {
  
  int id = null;
  
  String phoneNumber = null;
  
  int cityId = null;
  
  City city = null;
  
  List<LabTranslation> translations = [];
  
  LabTranslation content = null;
  Lab();

  @override
  String toString() {
    return 'Lab[id=$id, phoneNumber=$phoneNumber, cityId=$cityId, city=$city, translations=$translations, content=$content, ]';
  }

  Lab.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    cityId = json['cityId'];
    city = (json['city'] == null) ?
      null :
      City.fromJson(json['city']);
    translations = (json['translations'] == null) ?
      null :
      LabTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      LabTranslation.fromJson(json['content']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['phoneNumber'] = phoneNumber;
    if (cityId != null)
      json['cityId'] = cityId;
    if (city != null)
      json['city'] = city;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
    return json;
  }

  static List<Lab> listFromJson(List<dynamic> json) {
    return json == null ? List<Lab>() : json.map((value) => Lab.fromJson(value)).toList();
  }

  static Map<String, Lab> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Lab>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Lab.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Lab-objects as value to a dart map
  static Map<String, List<Lab>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Lab>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Lab.listFromJson(value);
       });
     }
     return map;
  }
}

