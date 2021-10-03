part of api.api;

class CategoryBiomarker {
  
  int? categoryId = null;
  
  Category? category = null;
  
  int? biomarkerId = null;
  
  Biomarker? biomarker = null;
  CategoryBiomarker();

  @override
  String toString() {
    return 'CategoryBiomarker[categoryId=$categoryId, category=$category, biomarkerId=$biomarkerId, biomarker=$biomarker, ]';
  }

  CategoryBiomarker.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    categoryId = json['categoryId'];
    category = (json['category'] == null) ?
      null :
      Category.fromJson(json['category']);
    biomarkerId = json['biomarkerId'];
    biomarker = (json['biomarker'] == null) ?
      null :
      Biomarker.fromJson(json['biomarker']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (categoryId != null)
      json['categoryId'] = categoryId;
    if (category != null)
      json['category'] = category;
    if (biomarkerId != null)
      json['biomarkerId'] = biomarkerId;
    if (biomarker != null)
      json['biomarker'] = biomarker;
    return json;
  }

  static List<CategoryBiomarker> listFromJson(List<dynamic> json) {
    return json == null ? <CategoryBiomarker>[] : json.map((value) => CategoryBiomarker.fromJson(value)).toList();
  }

  static Map<String, CategoryBiomarker> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CategoryBiomarker>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CategoryBiomarker.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CategoryBiomarker-objects as value to a dart map
  static Map<String, List<CategoryBiomarker>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CategoryBiomarker>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CategoryBiomarker.listFromJson(value);
       });
     }
     return map;
  }
}

