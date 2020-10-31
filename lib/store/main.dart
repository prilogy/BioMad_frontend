import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/user_extension.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/models/settings.dart';
import 'package:biomad_frontend/store/authorization/reducers.dart';
import 'package:biomad_frontend/store/settings/reducers.dart';
import 'package:biomad_frontend/store/user/reducers.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AppState {
  final User user;
  final Settings settings;
  final Authorization authorization;

  AppState(
      {@required this.user,
      @required this.settings,
      @required this.authorization});

  AppState.initialState()
      : user = UserExtension.fromLocalStorage(),
        settings = Settings.fromLocalStorage(),
        authorization = Authorization.fromLocalStorage();
}

AppState appStateReducer(AppState state, action) {
  return AppState(
      user: userReducer(state.user, action),
      settings: settingsReducer(
        state.settings,
        action,
      ),
      authorization: authorizationReducer(state.authorization, action));
}

final Store<AppState> store = Store<AppState>(appStateReducer,
    initialState: AppState.initialState(), middleware: [thunkMiddleware]);