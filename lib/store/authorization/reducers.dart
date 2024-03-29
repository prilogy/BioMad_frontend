import 'package:biomad_frontend/models/authorization.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final authorizationReducer = combineReducers<Authorization>([
  TypedReducer<Authorization?, Actions.SetAuthorization>(_setAuthorization) as Authorization Function(Authorization, dynamic),
  TypedReducer<Authorization, Actions.SetAuthorizationMemberId>(_setAuthorizationMemberId) as Authorization Function(Authorization, dynamic)
]);

Authorization? _setAuthorization(Authorization? state, Actions.SetAuthorization action) {
  Authorization.saveToLocalStorage(action.authorization);
  return action.authorization;
}

Authorization _setAuthorizationMemberId(Authorization state, Actions.SetAuthorizationMemberId action) {
  state.currentMemberId = action.id;
  Authorization.saveToLocalStorage(state);
  return state;
}