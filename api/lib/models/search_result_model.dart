part of api.api;

class SearchResultModel {
  
  List<Category> categories = [];
  
  List<Unit> units = [];
  
  List<Biomarker> biomarkers = [];
  
  List<City> cities = [];
  
  List<Lab> labs = [];
  SearchResultModel();

  @override
  String toString() {
    return 'SearchResultModel[categories=$categories, units=$units, biomarkers=$biomarkers, cities=$cities, labs=$labs, ]';
  }

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    categories = (json['categories'] == null) ?
      null :
      Category.listFromJson(json['categories']);
    units = (json['units'] == null) ?
      null :
      Unit.listFromJson(json['units']);
    biomarkers = (json['biomarkers'] == null) ?
      null :
      Biomarker.listFromJson(json['biomarkers']);
    cities = (json['cities'] == null) ?
      null :
      City.listFromJson(json['cities']);
    labs = (json['labs'] == null) ?
      null :
      Lab.listFromJson(json['labs']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
      json['categories'] = categories;
      json['units'] = units;
      json['biomarkers'] = biomarkers;
      json['cities'] = cities;
      json['labs'] = labs;
    return json;
  }

  static List<SearchResultModel> listFromJson(List<dynamic> json) {
    return json == null ? List<SearchResultModel>() : json.map((value) => SearchResultModel.fromJson(value)).toList();
  }

  static Map<String, SearchResultModel> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SearchResultModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SearchResultModel.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SearchResultModel-objects as value to a dart map
  static Map<String, List<SearchResultModel>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SearchResultModel>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SearchResultModel.listFromJson(value);
       });
     }
     return map;
  }
}

