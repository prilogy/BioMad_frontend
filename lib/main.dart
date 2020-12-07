import 'package:api/api.dart';
import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/localstorage.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/store/user/actions.dart';
import 'package:biomad_frontend/styles/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'services/api.dart' as apiService;
import 'services/dio.dart' as dioService;

void main() async {
  await Env.init('.env');
  await localStorage.ready;
  dioService.init();
  apiService.init();

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en'), Locale('ru')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
  ));
}

var connectionChecked = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ru", null);
    initializeDateFormatting("en", null);

    if (!connectionChecked)
      WidgetsBinding.instance.addPostFrameCallback(initAction);

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'BioMad',
        theme: AppTheme.light,
        navigatorKey: Keys.rootNavigator,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        initialRoute: store.state.authorization == null ||
                !store.state.authorization.isAuthorized
            ? '/auth'
            : '/main',
        builder: (context, child) => Scaffold(
          key: Keys.rootScaffold,
          body: child,
        ),
      ),
    );
  }

  /// Checks connection by calling api/user endpoint
  /// If OK - updates user info
  /// If TIMEOUT - shows snack bar
  /// If user == null - logs out
  Future initAction(dynamic _) async {
    store.dispatch(StoreThunks.refreshGendersAndCulture());

    if (store.state.authorization == null ||
        !store.state.authorization.isAuthorized) return;

    try {
      var user = await apiService.api.user.infoWithExceptionOnTimeOut();
      if (user != null)
        store.dispatch(SetUser(user));
      else
        store.dispatch(StoreThunks.logOut());
    } catch (e) {
      SnackBarExtension.dark(tr('snack_bar.offline_mode'),
          duration: Duration(hours: 2));
    }
    connectionChecked = true;
  }
}
