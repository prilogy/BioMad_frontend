part of api.api;

class ArticleTranslation {
  
  int id = null;
  
  int cultureId = null;
  
  Culture culture = null;
  
  String name = null;
  
  String text = null;
  
  int baseEntityId = null;
  
  Article baseEntity = null;
  ArticleTranslation();

  @override
  String toString() {
    return 'ArticleTranslation[id=$id, cultureId=$cultureId, culture=$culture, name=$name, text=$text, baseEntityId=$baseEntityId, baseEntity=$baseEntity, ]';
  }

  ArticleTranslation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    cultureId = json['cultureId'];
    culture = (json['culture'] == null) ?
      null :
      Culture.fromJson(json['culture']);
    name = json['name'];
    text = json['text'];
    baseEntityId = json['baseEntityId'];
    baseEntity = (json['baseEntity'] == null) ?
      null :
      Article.fromJson(json['baseEntity']);
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
      json['text'] = text;
    if (baseEntityId != null)
      json['baseEntityId'] = baseEntityId;
    if (baseEntity != null)
      json['baseEntity'] = baseEntity;
    return json;
  }

  static List<ArticleTranslation> listFromJson(List<dynamic> json) {
    return json == null ? List<ArticleTranslation>() : json.map((value) => ArticleTranslation.fromJson(value)).toList();
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

