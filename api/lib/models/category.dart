part of api.api;

class Category {
  
  int id = null;
  
  CategoryTranslation content = null;
  
  MemberCategoryState state = null;
  
  List<int> biomarkerIds = [];
  Category();

  @override
  String toString() {
    return 'Category[id=$id, content=$content, state=$state, biomarkerIds=$biomarkerIds, ]';
  }

  Category.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    content = (json['content'] == null) ?
      null :
      CategoryTranslation.fromJson(json['content']);
    state = (json['state'] == null) ?
      null :
      MemberCategoryState.fromJson(json['state']);
    biomarkerIds = (json['biomarkerIds'] == null) ?
      null :
      (json['biomarkerIds'] as List).cast<int>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (content != null)
      json['content'] = content;
    if (state != null)
      json['state'] = state;
      json['biomarkerIds'] = biomarkerIds;
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

