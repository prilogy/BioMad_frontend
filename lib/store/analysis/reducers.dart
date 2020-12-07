import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/gender_extension.dart';
import 'package:biomad_frontend/models/analysis_list.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final memberAnalysisListReducer = combineReducers<MemberAnalysisList>([
  TypedReducer<MemberAnalysisList, Actions.SetMemberAnalysisList>(_setMemberAnalysisList),
]);

MemberAnalysisList _setMemberAnalysisList(MemberAnalysisList state, Actions.SetMemberAnalysisList action) {
  MemberAnalysisList.saveToLocalStorage(action.memberAnalysis);
  return action.memberAnalysis;
}
