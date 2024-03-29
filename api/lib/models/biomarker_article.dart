part of api.api;

class BiomarkerArticle {
  
  int? biomarkerId = null;
  
  int? articleId = null;
  
  int? typeId = null;
  
  BiomarkerArticleType? type = null;
  BiomarkerArticle();

  @override
  String toString() {
    return 'BiomarkerArticle[biomarkerId=$biomarkerId, articleId=$articleId, typeId=$typeId, type=$type, ]';
  }

  BiomarkerArticle.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    biomarkerId = json['biomarkerId'];
    articleId = json['articleId'];
    typeId = json['typeId'];
    type = (json['type'] == null) ?
      null :
      BiomarkerArticleType.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (articleId != null)
      json['articleId'] = articleId;
    if (typeId != null)
      json['typeId'] = typeId;
    if (type != null)
      json['type'] = type;
    return json;
  }

  static List<BiomarkerArticle> listFromJson(List<dynamic>? json) {
    return json == null ? <BiomarkerArticle>[] : json.map((value) => BiomarkerArticle.fromJson(value)).toList();
  }

  static Map<String, BiomarkerArticle> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BiomarkerArticle>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BiomarkerArticle.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BiomarkerArticle-objects as value to a dart map
  static Map<String, List<BiomarkerArticle>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BiomarkerArticle>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BiomarkerArticle.listFromJson(value);
       });
     }
     return map;
  }
}

