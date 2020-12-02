import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/models/biomarkerList.dart';
import 'package:biomad_frontend/models/categoryList.dart';
import 'package:biomad_frontend/models/helper.dart';
import 'package:biomad_frontend/models/unitList.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';
import 'package:biomad_frontend/store/authorization/actions.dart';
import 'package:biomad_frontend/store/helper/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/settings/actions.dart';
import 'package:biomad_frontend/store/unit/actions.dart';
import 'package:biomad_frontend/store/user/actions.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'biomarker/actions.dart';
import 'category/actions.dart';

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
      store.dispatch(loadCategories());
      store.dispatch(refreshUnits());

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
      if (store.state.helper != null &&
          (store.state.helper?.lastUpdateDate
                  ?.difference(DateTime.now())
                  ?.inDays ?? 3) <
              2) return;

      var genders = await api.helper.genders();
      var cultures = await api.helper.cultures();
      store.dispatch(SetHelper(Helper(
          genders: genders,
          cultures: cultures,
          lastUpdateDate: DateTime.now())));
    };
  }

  static ThunkAction<AppState> refreshUnits() {
    return (Store<AppState> store) async {
      var res = await api.unit.info();
      store.dispatch(SetUnitList(UnitList(units: res)));
    };
  }

  static ThunkAction<AppState> loadCategories() {
    return (Store<AppState> store) async {
      var res = await api.category.info();
      var res2 = await api.biomarker.info();
      store.dispatch(SetCategory(CategoryList(categories: res)));
      store.dispatch(SetBiomarkerList(BiomarkerList(biomarkers: res2)));
    };
  }
}
