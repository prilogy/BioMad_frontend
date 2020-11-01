import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/helper/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/home_screen.dart';
import 'package:biomad_frontend/services/localstorage.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'BioMad',
        theme: AppTheme.light,
        navigatorKey: Keys.rootNavigator,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        initialRoute: store.state.authorization.isAuthorized ? '/main' : '/auth',
        builder: (context, child) => Scaffold(
          key: Keys.rootScaffold,
          body: child,
        ),
      ),
    );
  }
}
