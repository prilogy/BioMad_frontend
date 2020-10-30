import 'package:biomad_frontend/models/settings.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final settingsReducer = combineReducers<Settings>(
    [TypedReducer<Settings, Actions.SetSettings>(_setSettings)]);

Settings _setSettings(Settings state, Actions.SetSettings action) {

  return state;
}
