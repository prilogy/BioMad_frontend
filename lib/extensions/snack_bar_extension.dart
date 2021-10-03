import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:flutter/material.dart';

const _defaultDuration = Duration(seconds: 1, milliseconds: 500);

extension SnackBarExtension on SnackBar {
  static void show(SnackBar snackBar, bool hideCurrent) {
    if(hideCurrent == true)
      Keys.rootScaffold.currentState!.hideCurrentSnackBar();
    Keys.rootScaffold.currentState!.showSnackBar(snackBar);
  }

  static void error(String text, {Duration duration = _defaultDuration,  bool hideCurrent = true}) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.error,
      duration: duration,
    ), hideCurrent);
  }

  static void success(String text, {Duration duration = _defaultDuration,  bool hideCurrent = true}) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.success,
      duration: duration,
    ), hideCurrent);
  }

  static void warning(String text, {Duration duration = _defaultDuration,  bool hideCurrent = true}) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.warning,
      duration: duration,
    ), hideCurrent);
  }

  static void info(String text, {Duration duration = _defaultDuration,  bool hideCurrent = true}) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.primary,
      duration: duration,
    ), hideCurrent);
  }

  static void dark(String text, {Duration duration = _defaultDuration,  bool hideCurrent = true}) {
    SnackBarExtension.show(SnackBar(
      content: Text(text, style: TextStyle(color: BioMadColors.base[100]),),
      backgroundColor: BioMadColors.base[500],
      duration: duration,
    ), hideCurrent);
  }
}
