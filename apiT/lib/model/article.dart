part of api.api;

class Article {
  
  int id = null;
  
  List<ArticleTranslation> translations = [];
  
  ArticleTranslation content = null;
  Article();

  @override
  String toString() {
    return 'Article[id=$id, translations=$translations, content=$content, ]';
  }

  Article.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    translations = (json['translations'] == null) ?
      null :
      ArticleTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      ArticleTranslation.fromJson(json['content']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
    return json;
  }

  static List<Article> listFromJson(List<dynamic> json) {
    return json == null ? List<Article>() : json.map((value) => Article.fromJson(value)).toList();
  }

  static Map<String, Article> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Article>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Article.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Article-objects as value to a dart map
  static Map<String, List<Article>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Article>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Article.listFromJson(value);
       });
     }
     return map;
  }
}

