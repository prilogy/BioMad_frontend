import 'package:biomad_frontend/helper/keys.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:flutter/material.dart';

const _defaultDuration = Duration(seconds: 1, milliseconds: 500);

extension SnackBarExtension on SnackBar {
  static void show(SnackBar snackBar) {
    Keys.rootScaffold.currentState.hideCurrentSnackBar();
    Keys.rootScaffold.currentState.showSnackBar(snackBar);
  }

  static void error(String text, [Duration duration = _defaultDuration]) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.error,
      duration: duration,
    ));
  }

  static void success(String text, [Duration duration = _defaultDuration]) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.success,
      duration: duration,
    ));
  }

  static void warning(String text,  [Duration duration = _defaultDuration]) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.warning,
      duration: duration,
    ));
  }

  static void info(String text,  [Duration duration = _defaultDuration]) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.primary,
      duration: duration,
    ));
  }
}
