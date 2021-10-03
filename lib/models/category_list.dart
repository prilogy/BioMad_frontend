import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class CategoryList {
  List<Category>? categories = [];
  DateTime? lastUpdateDate;

  static String localStorageKey = "categoryList_state";

  CategoryList({this.categories, this.lastUpdateDate});

  CategoryList.fromJson(Map<String, dynamic> json) {
    categories = (json['categories'] == null)
        ? null
        : Category.listFromJson(json['categories']);
    lastUpdateDate = (json['lastUpdateDate'] == null)
        ? null
        : DateTime.parse(json['lastUpdateDate']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['categories'] = categories;
    if (lastUpdateDate != null)
      json['lastUpdateDate'] = lastUpdateDate == null ? null : lastUpdateDate!.toUtc().toIso8601String();
    return json;
  }

  static CategoryList fromLocalStorage() {
    var json = localStorage.getItem(localStorageKey);
    return CategoryList.fromJson(json ?? Map<String, dynamic>());
  }

  static void saveToLocalStorage(CategoryList model) {
    localStorage.setItem(localStorageKey, model.toJson());
  }
}
