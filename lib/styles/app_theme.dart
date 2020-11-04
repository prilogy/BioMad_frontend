import 'package:flutter/material.dart';

import 'biomad_colors.dart';

class AppTheme {
  static double borderWidth = 2.0;

  AppTheme._();

  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: BioMadColors.base[100],
      // nav bar's background color
      canvasColor: BioMadColors.base[300],
      /* theme colors */
      primaryColor: BioMadColors.primary,
      accentColor: BioMadColors.secondary,
      /* ------------ */
      appBarTheme: AppBarTheme(
          color: BioMadColors.base[100],
          iconTheme: IconThemeData(color: BioMadColors.primary),
          elevation: 0),
      colorScheme: ColorScheme(
          primary: BioMadColors.primary,
          primaryVariant: BioMadColors.primary[500],
          secondary: BioMadColors.primary,
          secondaryVariant: BioMadColors.primary[500],
          surface: BioMadColors.base[100],
          background: BioMadColors.base[100],
          error: BioMadColors.error,
          onPrimary: BioMadColors.base[100],
          onSecondary: BioMadColors.base[100],
          onSurface: BioMadColors.base[400],
          onBackground: BioMadColors.base[500],
          onError: BioMadColors.base,
          brightness: Brightness.light),
      textTheme: TextTheme(
          subtitle1: TextStyle(fontWeight: FontWeight.w500)));
}
