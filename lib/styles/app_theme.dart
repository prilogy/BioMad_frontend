import 'package:flutter/material.dart';

import 'biomad_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // scaffoldBackgroundColor: BioMadColors.base,
      // canvasColor: BioMadColors.base[400],
      // // nav bar's background color
      // /* theme colors */
      // primaryColor: BioMadColors.primary,
      // accentColor: BioMadColors.primary,
      // /* ------------ */
      // appBarTheme: AppBarTheme(
      //     color: BioMadColors.base[400],
      //     iconTheme: IconThemeData(color: BioMadColors.base[100])),
      // colorScheme: ColorScheme(
      //     primary: BioMadColors.primary,
      //     primaryVariant: BioMadColors.primary[500],
      //     secondary: BioMadColors.primary,
      //     secondaryVariant: BioMadColors.primary[500],
      //     surface: BioMadColors.base[400],
      //     background: BioMadColors.base,
      //     error: BioMadColors.error,
      //     onPrimary: BioMadColors.base[100],
      //     onSecondary: BioMadColors.base[100],
      //     onSurface: BioMadColors.base[100],
      //     onBackground: BioMadColors.base[100],
      //     onError: BioMadColors.base[100],
      //     brightness: Brightness.dark),
      // textTheme: new TextTheme(
      //     subtitle1: TextStyle(fontWeight: FontWeight.w500),
      //     caption: TextStyle(color: Colors.white))
  );
}
