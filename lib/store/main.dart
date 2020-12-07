import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/user_extension.dart';
import 'package:biomad_frontend/models/analysis_list.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/biomarker_type_list.dart';
import 'package:biomad_frontend/models/helper.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_model_list.dart';
import 'package:biomad_frontend/models/settings.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';
import 'package:biomad_frontend/store/authorization/reducers.dart';
import 'package:biomad_frontend/store/category/reducers.dart';
import 'package:biomad_frontend/store/settings/reducers.dart';
import 'package:biomad_frontend/store/unit/reducers.dart';
import 'package:biomad_frontend/store/user/reducers.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'analysis/reducers.dart';
import 'biomarker/reducers.dart';
import 'biomarker_type/reducers.dart';
import 'helper/reducers.dart';
import 'member_biomarker/reducers.dart';
import 'member_biomarker_tmp/reducers.dart';

class AppState {
  final User user;
  final Settings settings;
  final Authorization authorization;
  final Helper helper;
  final CategoryList categoryList;
  final UnitList unitList;
  final BiomarkerList biomarkerList;
  final BiomarkerTypeList biomarkerTypeList;
  final MemberBiomarkerList memberBiomarkerList;
  final MemberBiomarkerList memberBiomarkerModelList;
  final MemberAnalysisList memberAnalysisList;

  AppState(
      {@required this.user,
      @required this.settings,
      @required this.authorization,
      @required this.categoryList,
      @required this.unitList,
      @required this.biomarkerList,
      @required this.biomarkerTypeList,
      @required this.memberBiomarkerList,
      @required this.memberBiomarkerModelList,
      @required this.memberAnalysisList,
      @required this.helper
      });

  AppState.initialState()
      : user = UserExtension.fromLocalStorage(),
        settings = Settings.fromLocalStorage(),
        authorization = Authorization.fromLocalStorage(),
        categoryList = CategoryList.fromLocalStorage(),
        unitList = UnitList.fromLocalStorage(),
        biomarkerList = BiomarkerList.fromLocalStorage(),
        biomarkerTypeList = BiomarkerTypeList.fromLocalStorage(),
        memberBiomarkerList = MemberBiomarkerList.fromLocalStorage(),
        memberBiomarkerModelList = MemberBiomarkerList.fromLocalStorage(),
        memberAnalysisList = MemberAnalysisList.fromLocalStorage(),
        helper = Helper.fromLocalStorage();
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
    settings: settingsReducer(
      state.settings,
      action,
    ),
    authorization: authorizationReducer(state.authorization, action),
    helper: helperReducer(state.helper, action),
    categoryList: categoryReducer(state.categoryList, action),
    unitList: unitListReducer(state.unitList, action),
    biomarkerList: biomarkerListReducer(state.biomarkerList, action),
    biomarkerTypeList: biomarkerTypeListReducer(state.biomarkerTypeList, action),
    memberBiomarkerList: memberBiomarkerListReducer(state.memberBiomarkerList, action),
    memberBiomarkerModelList: memberBiomarkerModelListReducer(state.memberBiomarkerModelList, action),
    memberAnalysisList: memberAnalysisListReducer(state.memberAnalysisList, action),
  );
}

final Store<AppState> store = Store<AppState>(appStateReducer,
    initialState: AppState.initialState(), middleware: [thunkMiddleware]);
