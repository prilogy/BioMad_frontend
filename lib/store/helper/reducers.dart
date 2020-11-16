import 'package:biomad_frontend/models/helper.dart';
import 'package:biomad_frontend/models/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final helperReducer = combineReducers<Helper>(
    [TypedReducer<Helper, Actions.SetHelper>(_setHelper)]);

Helper _setHelper(Helper state, Actions.SetHelper action) {
  Helper.saveToLocalStorage(action.helper);
  return action.helper;
}
