import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_model_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final memberBiomarkerModelListReducer = combineReducers<MemberBiomarkerModelList>([
  TypedReducer<MemberBiomarkerModelList, Actions.SetMemberBiomarkerModelList>(
      _setMemberBiomarkerModelList),
]);

MemberBiomarkerModelList _setMemberBiomarkerModelList(
    MemberBiomarkerModelList state, Actions.SetMemberBiomarkerModelList action) {
  MemberBiomarkerModelList.saveToLocalStorage(action.biomarkers);
  return action.biomarkers;
}
