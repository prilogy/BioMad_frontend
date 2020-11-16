import 'package:biomad_frontend/models/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final settingsReducer = combineReducers<Settings>(
    [TypedReducer<Settings, Actions.SetSettings>(_setSettings),
    TypedReducer<Settings, Actions.SetGenders>(_setGenders)]);

Settings _setSettings(Settings state, Actions.SetSettings action) {
  Settings.saveToLocalStorage(action.settings);
  return action.settings;
}

Settings _setGenders(Settings state, Actions.SetGenders action) {
  state.genders = action.genders;
  Settings.saveToLocalStorage(state);
  return state;
}
