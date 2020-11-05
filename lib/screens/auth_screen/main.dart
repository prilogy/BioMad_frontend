import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/app_exit_helper.dart';
import 'package:biomad_frontend/screens/auth_screen/login_screen.dart';
import 'package:biomad_frontend/screens/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget{
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final navigatorKey = GlobalKey<NavigatorState>();
  AppExitHelper _exitHelper;

  @override
  void initState() {
    _exitHelper = AppExitHelper(navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitHelper.onWillPop,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (context) =>
            MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }
}