import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/user_extension.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/models/biomarkerList.dart';
import 'package:biomad_frontend/models/helper.dart';
import 'package:biomad_frontend/models/memberBiomarkerList.dart';
import 'package:biomad_frontend/models/settings.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:biomad_frontend/models/unitList.dart';
import 'package:biomad_frontend/store/authorization/reducers.dart';
import 'package:biomad_frontend/store/category/reducers.dart';
import 'package:biomad_frontend/store/settings/reducers.dart';
import 'package:biomad_frontend/store/unit/reducers.dart';
import 'package:biomad_frontend/store/user/reducers.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'biomarker/reducers.dart';
import 'helper/reducers.dart';
import 'memberBiomarker/reducers.dart';

class AppState {
  final User user;
  final Settings settings;
  final Authorization authorization;
  final Helper helper;
  final CategoryList categoryList;
  final UnitList unitList;
  final BiomarkerList biomarkerList;
  final MemberBiomarkerList memberBiomarkerList;

  AppState(
      {@required this.user,
      @required this.settings,
      @required this.authorization,
      @required this.categoryList,
      @required this.unitList,
      @required this.biomarkerList,
      @required this.memberBiomarkerList,
      @required this.helper
      });

  AppState.initialState()
      : user = UserExtension.fromLocalStorage(),
        settings = Settings.fromLocalStorage(),
        authorization = Authorization.fromLocalStorage(),
        categoryList = CategoryList.fromLocalStorage(),
        unitList = UnitList.fromLocalStorage(),
        biomarkerList = BiomarkerList.fromLocalStorage(),
        memberBiomarkerList = MemberBiomarkerList.fromLocalStorage(),
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
    memberBiomarkerList: memberBiomarkerListReducer(state.memberBiomarkerList, action),
  );
}

final Store<AppState> store = Store<AppState>(appStateReducer,
    initialState: AppState.initialState(), middleware: [thunkMiddleware]);
