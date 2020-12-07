import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_model_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final memberBiomarkerModelListReducer = combineReducers<MemberBiomarkerList>([
  TypedReducer<MemberBiomarkerList, Actions.SetMemberBiomarkerModelList>(
      _setMemberBiomarkerModelList),
]);

MemberBiomarkerList _setMemberBiomarkerModelList(
    MemberBiomarkerList state, Actions.SetMemberBiomarkerModelList action) {
  MemberBiomarkerList.saveToLocalStorage(action.biomarkers);
  return action.biomarkers;
}
