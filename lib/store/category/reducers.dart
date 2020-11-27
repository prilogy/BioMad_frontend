import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final categoryReducer = combineReducers<Category>([
  TypedReducer<Category, Actions.SetCategory>(_setCategory),
]);

Category _setCategory(Category state, Actions.SetCategory action) {
  Category.saveToLocalStorage(action.category);
  return action.category;
}
