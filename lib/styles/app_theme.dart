import 'package:flutter/material.dart';

import 'biomad_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: BioMadColors.base[100],
      // nav bar's background color
      canvasColor: BioMadColors.base[300],
      /* theme colors */
      primaryColor: BioMadColors.primary,
      accentColor: BioMadColors.primary,
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
          surface: BioMadColors.base[400],
          background: BioMadColors.base[100],
          error: BioMadColors.error,
          onPrimary: BioMadColors.base[100],
          onSecondary: BioMadColors.base[100],
          onSurface: BioMadColors.base[100],
          onBackground: BioMadColors.base,
          onError: BioMadColors.base,
          brightness: Brightness.light),
      textTheme: TextTheme(
          subtitle1: TextStyle(fontWeight: FontWeight.w500),
          caption: TextStyle(color: Colors.white)));
}
