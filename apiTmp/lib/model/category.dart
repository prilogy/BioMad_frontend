part of api.api;

class Category {
  
  int id = null;
  
  List<CategoryTranslation> translations = [];
  
  CategoryTranslation content = null;
  
  MemberCategoryState state = null;
  
  List<Biomarker> biomarkers = [];
  
  List<int> biomarkerIds = [];
  
  List<CategoryBiomarker> categoryBiomarkers = [];
  Category();

  @override
  String toString() {
    return 'Category[id=$id, translations=$translations, content=$content, state=$state, biomarkers=$biomarkers, biomarkerIds=$biomarkerIds, categoryBiomarkers=$categoryBiomarkers, ]';
  }

  Category.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    translations = (json['translations'] == null) ?
      null :
      CategoryTranslation.listFromJson(json['translations']);
    content = (json['content'] == null) ?
      null :
      CategoryTranslation.fromJson(json['content']);
    state = (json['state'] == null) ?
      null :
      MemberCategoryState.fromJson(json['state']);
    biomarkers = (json['biomarkers'] == null) ?
      null :
      Biomarker.listFromJson(json['biomarkers']);
    biomarkerIds = (json['biomarkerIds'] == null) ?
      null :
      (json['biomarkerIds'] as List).cast<int>();
    categoryBiomarkers = (json['categoryBiomarkers'] == null) ?
      null :
      CategoryBiomarker.listFromJson(json['categoryBiomarkers']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
      json['translations'] = translations;
    if (content != null)
      json['content'] = content;
    if (state != null)
      json['state'] = state;
      json['biomarkers'] = biomarkers;
      json['biomarkerIds'] = biomarkerIds;
      json['categoryBiomarkers'] = categoryBiomarkers;
    return json;
  }

  static List<Category> listFromJson(List<dynamic> json) {
    return json == null ? List<Category>() : json.map((value) => Category.fromJson(value)).toList();
  }

  static Map<String, Category> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Category>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Category.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Category-objects as value to a dart map
  static Map<String, List<Category>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Category>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Category.listFromJson(value);
       });
     }
     return map;
  }
}

