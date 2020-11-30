import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:biomad_frontend/models/unitList.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final unitListReducer = combineReducers<UnitList>([
  TypedReducer<UnitList, Actions.SetUnitList>(_setUnitList),
]);

UnitList _setUnitList(UnitList state, Actions.SetUnitList action) {
  UnitList.saveToLocalStorage(action.units);
  return action.units;
}
