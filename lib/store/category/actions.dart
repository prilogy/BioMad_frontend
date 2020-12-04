import 'package:api/api.dart';
import 'package:biomad_frontend/models/category_list.dart';

class SetCategory {
  final CategoryList category;

  SetCategory(this.category);

  @override
  String toString() {
    return 'CategoryList -> SetCategoryList{categoryList: $category}';
  }
}