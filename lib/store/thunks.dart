import 'package:api/api.dart';
import 'package:biomad_frontend/helper/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/store/authorization/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/user/actions.dart';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

typedef AuthenticationResultGetter = Future<AuthenticationResult> Function();

class StoreThunks {
  static ThunkAction<AppState> authorize(AuthenticationResultGetter getter, {VoidCallback onSuccess, VoidCallback onError}) {
    return (Store<AppState> store) async {
      var res = await getter();
      if (res == null) {
        await onError?.call();
        return;
      }

      var auth = Authorization(
          accessToken: res.accessToken,
          currentMemberId: res.user.currentMemberId,
          refreshToken: res.refreshToken);

      store.dispatch(SetUser(res.user));
      store.dispatch(SetAuthorization(auth));
      await onSuccess?.call();
    };
  }

  static ThunkAction<AppState> logOut() {
    return (Store<AppState> store) {
      store.dispatch(SetUser(null));
      store.dispatch(SetAuthorization(null));
      Keys.rootNavigator.currentState.pushReplacementNamed('/auth');
    };
  }
}
