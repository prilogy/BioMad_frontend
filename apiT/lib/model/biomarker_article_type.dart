part of api.api;

class BiomarkerArticleType {
  
  int id = null;
  
  String key = null;
  BiomarkerArticleType();

  @override
  String toString() {
    return 'BiomarkerArticleType[id=$id, key=$key, ]';
  }

  BiomarkerArticleType.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['key'] = key;
    return json;
  }

  static List<BiomarkerArticleType> listFromJson(List<dynamic> json) {
    return json == null ? List<BiomarkerArticleType>() : json.map((value) => BiomarkerArticleType.fromJson(value)).toList();
  }

  static Map<String, BiomarkerArticleType> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerArticleType>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerArticleType.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerArticleType-objects as value to a dart map
  static Map<String, List<BiomarkerArticleType>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerArticleType>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerArticleType.listFromJson(value);
       });
     }
     return map;
  }
}

