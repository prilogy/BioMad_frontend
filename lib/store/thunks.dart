import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';
import 'package:biomad_frontend/store/authorization/actions.dart';
import 'package:biomad_frontend/store/gender/actions.dart';
import 'package:biomad_frontend/store/helper/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/settings/actions.dart';
import 'package:biomad_frontend/store/user/actions.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

typedef AuthenticationResultGetter = Future<AuthenticationResult> Function();

class StoreThunks {
  static ThunkAction<AppState> authorize(AuthenticationResultGetter getter,
      {VoidCallback onSuccess, VoidCallback onError}) {
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

      // TODO: remove -------------------
      var gen = await api.helper.genders();
      var genObject = gen.firstWhere((x)=>x.id == store.state.authorization.currentMember.genderId);
      store.dispatch(SetGender(genObject));
      //Отладка
      print(genObject); //Подгруженный объект
      //print(store.state.gender.id); //Id гендера в сторе
      print(localStorage.getItem("gender_state")); //Текущее состояние локал стора
      // --------------------------------

      await onSuccess?.call();
    };
  }

  static ThunkAction<AppState> authorizeWithRefreshToken(
      {VoidCallback onSuccess, VoidCallback onError}) {
    return (Store<AppState> store) async {
      store.dispatch(StoreThunks.authorize(() async {
        return await api.auth.refreshToken(RefreshTokenAuthenticationModel(
            refreshToken: store.state.authorization.refreshToken.token,
            userId: store.state.user.id,
            memberId: store.state.authorization.currentMemberId));
      }, onError: onError, onSuccess: onSuccess));
    };
  }

  static ThunkAction<AppState> logOut([String snackBarText]) {
    return (Store<AppState> store) {
      //Keys.rootNavigator.currentState.pushReplacementNamed(Routes.auth);
      store.dispatch(SetUser(null));
      store.dispatch(SetAuthorization(null));
      SnackBarExtension.info(snackBarText ?? tr('snack_bar.log_out'));
    };
  }

  static ThunkAction<AppState> refreshGendersAndCulture() {
    return (Store<AppState> store) async {
      var genders = await api.helper.genders();
      //store.dispatch(SetHelper(genders));
    };
  }
}
