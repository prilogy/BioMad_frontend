import 'package:biomad_frontend/models/biomarker_type_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final biomarkerTypeListReducer = combineReducers<BiomarkerTypeList>([
  TypedReducer<BiomarkerTypeList, Actions.SetBiomarkerTypeList>(_setBiomarkerTypeList),
]);

BiomarkerTypeList _setBiomarkerTypeList(BiomarkerTypeList state, Actions.SetBiomarkerTypeList action) {
  BiomarkerTypeList.saveToLocalStorage(action.biomarkerTypes);
  return action.biomarkerTypes;
}
