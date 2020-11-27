import 'package:api/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';

class CategoryList {
  List<Category> categories;

  static String localStorageKey = "categoryList_state";

  CategoryList({this.categories});

  CategoryList.fromJson(Map<String, dynamic> json) {
    categories = (json['categories'] == null)
        ? null
        : Category.listFromJson(json['categories']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['categories'] = categories;
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
