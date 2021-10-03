import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/user_extension.dart';
import 'package:redux/redux.dart';
import 'actions.dart' as Actions;

final userReducer = combineReducers<User?>([
  TypedReducer<User?, Actions.SetUser>(_setUser),
]);

User? _setUser(User? state, Actions.SetUser action) {
  UserExtension.saveToLocalStorage(action.user);
  return action.user;
}
