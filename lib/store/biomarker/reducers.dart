import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final biomarkerListReducer = combineReducers<BiomarkerList>([
  TypedReducer<BiomarkerList, Actions.SetBiomarkerList>(_setBiomarkerList),
]);

BiomarkerList _setBiomarkerList(BiomarkerList state, Actions.SetBiomarkerList action) {
  BiomarkerList.saveToLocalStorage(action.biomarkers);
  return action.biomarkers;
}
