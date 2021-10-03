import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppExitHelper {
  DateTime? _currentBackPressTime;
  Key _navigatorKey;


  AppExitHelper(this._navigatorKey);

  Future<bool?> onWillPop() async {
    final NavigatorState navigator =
        (_navigatorKey as GlobalKey<NavigatorState>).currentState!;
    if (!navigator.canPop()) {
      DateTime now = DateTime.now();
      if (_currentBackPressTime == null ||
          now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
        _currentBackPressTime = now;
        SnackBarExtension.dark(tr('snack_bar.app_exit'));
        return null;
      }
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }

    navigator.pop();
    return false;
  }
}
