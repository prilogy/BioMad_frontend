import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/analysis_list.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/models/biomarker_type_list.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/models/helper.dart';
import 'package:biomad_frontend/models/lab_list.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/models/member_biomarker_model_list.dart';
import 'package:biomad_frontend/models/unit_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/services/localstorage.dart';
import 'package:biomad_frontend/store/authorization/actions.dart';
import 'package:biomad_frontend/store/biomarker_type/actions.dart';
import 'package:biomad_frontend/store/helper/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/settings/actions.dart';
import 'package:biomad_frontend/store/unit/actions.dart';
import 'package:biomad_frontend/store/user/actions.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'analysis/actions.dart';
import 'biomarker/actions.dart';
import 'category/actions.dart';
import 'lab/actions.dart';
import 'member_biomarker/actions.dart';
import 'member_biomarker_model/actions.dart';

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
      store.dispatch(refreshCategoriesAndTypes());
      store.dispatch(refreshBiomarkers());
      store.dispatch(refreshMemberBiomarkers());
      store.dispatch(refreshMemberAnalysis());
      store.dispatch(refreshUnitsAndLabs());

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
                      ?.inDays ??
                  3) <
              2) return;

      var genders = await api.helper.genders();
      var cultures = await api.helper.cultures();
      store.dispatch(SetHelper(Helper(
          genders: genders,
          cultures: cultures,
          lastUpdateDate: DateTime.now())));
    };
  }

  static ThunkAction<AppState> refreshUnitsAndLabs() {
    return (Store<AppState> store) async {
      store.dispatch(SetUnitList(UnitList(units: await api.unit.info())));
      store.dispatch(SetLabList(LabList(labs: await api.lab.info())));
    };
  }

  static ThunkAction<AppState> refreshCategoriesAndTypes() {
    return (Store<AppState> store) async {
      store.dispatch(
          SetCategory(CategoryList(categories: await api.category.info())));
      store.dispatch(SetBiomarkerTypeList(
          BiomarkerTypeList(types: await api.biomarker.type())));
    };
  }

  static ThunkAction<AppState> refreshBiomarkers() {
    return (Store<AppState> store) async {
      store.dispatch(SetBiomarkerList(
          BiomarkerList(biomarkers: await api.biomarker.info())));
    };
  }

  static ThunkAction<AppState> refreshMemberBiomarkers() {
    return (Store<AppState> store) async {
      store.dispatch(SetMemberBiomarkerList(
          MemberBiomarkerList(biomarkers: await api.memberBiomarker.info())));
    };
  }

  static ThunkAction<AppState> refreshMemberAnalysis() {
    return (Store<AppState> store) async {
      store.dispatch(SetMemberAnalysisList(
          MemberAnalysisList(analysis: await api.memberAnalysis.info())));
    };
  }

  static ThunkAction<AppState> setMemberBiomarkerModels(
      List<MemberBiomarkerModel> biomarkerModelList) {
    return (Store<AppState> store) async {
      store.dispatch(SetMemberBiomarkerModelList(
          MemberBiomarkerModelList(biomarkers: biomarkerModelList)));
    };
  }
}
