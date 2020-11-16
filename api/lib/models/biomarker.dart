part of api.api;

class Biomarker {
  
  int id = null;
  
  int typeId = null;
  
  BiomarkerType type = null;
  
  List<BiomarkerTranslation> translations = [];
  
  BiomarkerTranslation content = null;
  
  List<Category> categories = [];
  
  List<Article> articles = [];
  
  List<Unit> units = [];
  
  List<BiomarkerReference> references = [];
  
  List<CategoryBiomarker> categoryBiomarkers = [];
  
  List<BiomarkerArticle> biomarkerArticles = [];
  
  List<BiomarkerUnit> biomarkerUnits = [];
  Biomarker();

  @override
  String toString() {
    return 'Biomarker[id=$id, typeId=$typeId, type=$type, translations=$translations, content=$content, categories=$categories, articles=$articles, units=$units, references=$references, categoryBiomarkers=$categoryBiomarkers, biomarkerArticles=$biomarkerArticles, biomarkerUnits=$biomarkerUnits, ]';
  }

  Biomarker.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    typeId = json['typeId'];
    type = (json['type'] == null) ?
      null :
      BiomarkerType.fromJson(json['type']);
    translations = (json['translations'] == null) ?
      null :
      BiomarkerTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      BiomarkerTranslation.fromJson(json['content']);
    categories = (json['categories'] == null) ?
      null :
      Category.listFromJson(json['categories']);
    articles = (json['articles'] == null) ?
      null :
      Article.listFromJson(json['articles']);
    units = (json['units'] == null) ?
      null :
      Unit.listFromJson(json['units']);
    references = (json['references'] == null) ?
      null :
      BiomarkerReference.listFromJson(json['references']);
    categoryBiomarkers = (json['categoryBiomarkers'] == null) ?
      null :
      CategoryBiomarker.listFromJson(json['categoryBiomarkers']);
    biomarkerArticles = (json['biomarkerArticles'] == null) ?
      null :
      BiomarkerArticle.listFromJson(json['biomarkerArticles']);
    biomarkerUnits = (json['biomarkerUnits'] == null) ?
      null :
      BiomarkerUnit.listFromJson(json['biomarkerUnits']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (typeId != null)
      json['typeId'] = typeId;
    if (type != null)
      json['type'] = type;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
      json['categories'] = categories;
      json['articles'] = articles;
      json['units'] = units;
      json['references'] = references;
      json['categoryBiomarkers'] = categoryBiomarkers;
      json['biomarkerArticles'] = biomarkerArticles;
      json['biomarkerUnits'] = biomarkerUnits;
    return json;
  }

  static List<Biomarker> listFromJson(List<dynamic> json) {
    return json == null ? List<Biomarker>() : json.map((value) => Biomarker.fromJson(value)).toList();
  }

  static Map<String, Biomarker> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Biomarker>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Biomarker.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Biomarker-objects as value to a dart map
  static Map<String, List<Biomarker>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Biomarker>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Biomarker.listFromJson(value);
       });
     }
     return map;
  }
}

