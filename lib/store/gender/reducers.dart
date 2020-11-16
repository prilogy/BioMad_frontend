import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final genderReducer = combineReducers<Gender>([
  TypedReducer<Gender, Actions.SetGender>(_setGender),
]);

Gender _setGender(Gender state, Actions.SetGender action) {
  GenderExtension.saveToLocalStorage(action.gender);
  return action.gender;
}
