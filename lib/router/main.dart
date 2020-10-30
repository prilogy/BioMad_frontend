import 'package:biomad_frontend/screens/auth_screen.dart';
import 'package:biomad_frontend/screens/home_screen.dart';
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

final authRoute = RouteBuilder('/auth', (args) => AuthScreen(), false);

final routes = [
  authRoute,
  RouteBuilder('/main', (args) => MyHomePage())
];

class RouteBuilder {
  final String routeName;
  final Widget Function(dynamic args) widget;
  final bool requireAuthorization;

  RouteBuilder(this.routeName, this.widget, [this.requireAuthorization = true]);
}
