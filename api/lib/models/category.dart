part of api.api;

class Category {
  int id = null;

  List<CategoryTranslation> translations = [];

  CategoryTranslation content = null;

  List<Biomarker> biomarkers = [];

  List<CategoryBiomarker> categoryBiomarkers = [];

  Category();

  static String localStorageKey = "category_state";

  @override
  String toString() {
    return 'Category[id=$id, translations=$translations, content=$content, biomarkers=$biomarkers, categoryBiomarkers=$categoryBiomarkers, ]';
  }

  Category.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    translations = (json['translations'] == null)
        ? null
        : CategoryTranslation.listFromJson(json['translations']);
    content = (json['content'] == null)
        ? null
        : CategoryTranslation.fromJson(json['content']);
    biomarkers = (json['biomarkers'] == null)
        ? null
        : Biomarker.listFromJson(json['biomarkers']);
    categoryBiomarkers = (json['categoryBiomarkers'] == null)
        ? null
        : CategoryBiomarker.listFromJson(json['categoryBiomarkers']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    json['translations'] = translations;
    if (content != null) json['content'] = content;
    json['biomarkers'] = biomarkers;
    json['categoryBiomarkers'] = categoryBiomarkers;
    return json;
  }

  static List<Category> listFromJson(List<dynamic> json) {
    return json == null
        ? List<Category>()
        : json.map((value) => Category.fromJson(value)).toList();
  }

  static Map<String, Category> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Category>();
    if (json != null && json.isNotEmpty) {
      json.forEach(
          (String key, dynamic value) => map[key] = Category.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Category-objects as value to a dart map
  static Map<String, List<Category>> mapListFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, List<Category>>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = Category.listFromJson(value);
      });
    }
    return map;
  }

  static Category fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return Category.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(Category model) {
    localStorage.setItem(localStorageKey, jsonEncode(model));
  }
}
