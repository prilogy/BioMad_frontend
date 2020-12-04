import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final memberBiomarkerListReducer = combineReducers<MemberBiomarkerList>([
  TypedReducer<MemberBiomarkerList, Actions.SetMemberBiomarkerList>(_setMemberBiomarkerList),
]);

MemberBiomarkerList _setMemberBiomarkerList(MemberBiomarkerList state, Actions.SetMemberBiomarkerList action) {
  MemberBiomarkerList.saveToLocalStorage(action.biomarkers);
  return action.biomarkers;
}
