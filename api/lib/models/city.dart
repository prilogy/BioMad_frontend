part of api.api;

class City {
  int id = null;

  List<CityTranslation> translations = [];

  CityTranslation content = null;

  List<Lab> labs = [];

  List<int> labIds = [];

  City();

  @override
  String toString() {
    return 'City[id=$id, translations=$translations, content=$content, labs=$labs, labIds=$labIds, ]';
  }

  City.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    translations = (json['translations'] == null)
        ? null
        : CityTranslation.listFromJson(json['translations']);
    content = (json['content'] == null)
        ? null
        : CityTranslation.fromJson(json['content']);
    labs = (json['labs'] == null) ? null : Lab.listFromJson(json['labs']);
    labIds =
        (json['labIds'] == null) ? null : (json['labIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    json['translations'] = translations;
    if (content != null) json['content'] = content;
    json['labs'] = labs;
    json['labIds'] = labIds;
    return json;
  }

  static List<City> listFromJson(List<dynamic> json) {
    return json == null
        ? List<City>()
        : json.map((value) => City.fromJson(value)).toList();
  }

  static Map<String, City> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, City>();
    if (json != null && json.isNotEmpty) {
      json.forEach(
          (String key, dynamic value) => map[key] = City.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of City-objects as value to a dart map
  static Map<String, List<City>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<City>>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = City.listFromJson(value);
      });
    }
    return map;
  }
}
