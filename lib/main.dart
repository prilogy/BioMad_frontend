import 'package:biomad_frontend/config/env.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/styles/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'services/api.dart' as apiService;
import 'services/dio.dart' as dioService;

void main() async {
  await Env.init('.env');
  dioService.init();
  apiService.init();

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en'), Locale('ru')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
  ));
}

final rootScaffold = GlobalKey<ScaffoldState>();
final rootNavigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioMad',
      theme: AppTheme.light,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      initialRoute: '/main',
      builder: (context, child) => Scaffold(
        key: rootScaffold,
        body: child,
      ),
    );
  }
}
