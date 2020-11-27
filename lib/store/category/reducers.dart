import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final categoryReducer = combineReducers<CategoryList>([
  TypedReducer<CategoryList, Actions.SetCategory>(_setCategory),
]);

CategoryList _setCategory(CategoryList state, Actions.SetCategory action) {
  CategoryList.saveToLocalStorage(action.category);
  print("REDUCE IT!");
  return action.category;
}
