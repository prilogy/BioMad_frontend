import 'package:api/api.dart';
import 'package:biomad_frontend/screens/add_analysis_screen.dart';
import 'package:biomad_frontend/screens/auth_screen/login_screen.dart';
import 'package:biomad_frontend/screens/auth_screen/main.dart';
import 'package:biomad_frontend/screens/monitoring_screen.dart';
import 'package:biomad_frontend/screens/member_screen.dart';
import 'package:biomad_frontend/screens/biomarker_screen.dart';
import 'package:biomad_frontend/screens/biomarker_list_screen.dart';
import 'package:biomad_frontend/screens/category_analysis_screen.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    var route = routes.firstWhere((x) => x.routeName == settings.name,
        orElse: () => null);

    if (route != null) {
      var pass = !route.requireAuthorization ||
          (route.requireAuthorization && store.state.user != null);
      return MaterialPageRoute(
          builder: (context) =>
          pass ? route.widget(args) : authRoute.widget(args));
    }
  }
}

class Routes {
  static const auth = '/auth';
  static const main = '/main';
  static const member = '/member';
  static const biomarker = '/biomarker';
  static const biomarker_list = '/biomarker_list';
  static const category_analysis = '/category_analysis';
  static const add_analysis = '/add_analysis';
}

final authRoute = RouteBuilder(Routes.auth, (args) => AuthScreen(), false);

final routes = [
  authRoute,
  RouteBuilder(Routes.main, (args) => MyHomePage(title: "s",)),
  RouteBuilder(Routes.member, (args) => MemberScreen(member: args as Member)),
  RouteBuilder(Routes.biomarker, (args) => BioMarkerScreen(biomarker: args as MemberBiomarker)),
  RouteBuilder(Routes.biomarker_list, (args) => BioMarkerListScreen(id: args as int,)),
  RouteBuilder(Routes.category_analysis, (args) => CategoryAnalysisScreen(categoryId: args as int,)),
  RouteBuilder(Routes.add_analysis, (args) => AddAnalysisScreen(title: "s",)),
];


class RouteBuilder {
  final String routeName;
  final Widget Function(dynamic args) widget;
  final bool requireAuthorization;

  RouteBuilder(this.routeName, this.widget, [this.requireAuthorization = true]);
}
