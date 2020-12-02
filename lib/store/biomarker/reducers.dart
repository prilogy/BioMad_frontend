import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:biomad_frontend/models/biomarkerList.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:biomad_frontend/models/unitList.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final biomarkerListReducer = combineReducers<BiomarkerList>([
  TypedReducer<BiomarkerList, Actions.SetBiomarkerList>(_setUnitList),
]);

BiomarkerList _setUnitList(BiomarkerList state, Actions.SetBiomarkerList action) {
  BiomarkerList.saveToLocalStorage(action.biomarkers);
  return action.biomarkers;
}
