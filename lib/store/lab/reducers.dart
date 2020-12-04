import 'package:biomad_frontend/models/lab_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final labListReducer = combineReducers<LabList>([
  TypedReducer<LabList, Actions.SetLabList>(_setLabList),
]);

LabList _setLabList(LabList state, Actions.SetLabList action) {
  LabList.saveToLocalStorage(action.labs);
  return action.labs;
}
