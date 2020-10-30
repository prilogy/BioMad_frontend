import 'package:api/api.dart';
import 'package:biomad_frontend/models/settings.dart';
import 'package:biomad_frontend/store/settings/reducers.dart';
import 'package:biomad_frontend/store/user/reducers.dart';
import 'package:flutter/material.dart';
import 'package:biomad_frontend/extensions/user_extension.dart';
import 'package:redux/redux.dart';

class AppState {
  final User user;
  final Settings settings;

  AppState({@required this.user, @required this.settings});

  AppState.initialState()
      : user = UserExtension.fromLocalStorage(),
        settings = Settings.fromLocalStorage();

}

AppState appStateReducer(AppState state, action) {
  return AppState(
      user: userReducer(state.user, action),
      settings: settingsReducer(state.settings, action)
  );
}

final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState()
);