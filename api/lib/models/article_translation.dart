part of api.api;

class ArticleTranslation {
  
  String? name = null;
  
  String? text = null;
  
  int? baseEntityId = null;
  
  int? cultureId = null;
  ArticleTranslation();

  @override
  String toString() {
    return 'ArticleTranslation[name=$name, text=$text, baseEntityId=$baseEntityId, cultureId=$cultureId, ]';
  }

  ArticleTranslation.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    text = json['text'];
    baseEntityId = json['baseEntityId'];
    cultureId = json['cultureId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['name'] = name;
      json['text'] = text;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (cultureId != null)
      json['cultureId'] = cultureId;
    return json;
  }

  static List<ArticleTranslation> listFromJson(List<dynamic> json) {
    return json == null ? <ArticleTranslation>[] : json.map((value) => ArticleTranslation.fromJson(value)).toList();
  }

  static Map<String, ArticleTranslation> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ArticleTranslation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ArticleTranslation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ArticleTranslation-objects as value to a dart map
  static Map<String, List<ArticleTranslation>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<ArticleTranslation>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = ArticleTranslation.listFromJson(value);
       });
     }
     return map;
  }
}

