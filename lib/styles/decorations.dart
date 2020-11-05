import 'package:biomad_frontend/styles/app_theme.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

import 'color_opacity.dart';

class Decorations {
  static BorderRadius borderRadius = BorderRadius.all(Radius.circular(RadiusValues.less));
  static double borderWidth = AppTheme.borderWidth;

  static InputDecoration input(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = Decorations.borderRadius;
    final borderWidth = Decorations.borderWidth;

    return InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: theme.primaryColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: theme.canvasColor, width: borderWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: theme.errorColor, width: borderWidth),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: theme.errorColor.withOpacity(ColorAlphas.a30),
              width: borderWidth),
        ),
        errorStyle: TextStyle(color: theme.errorColor));
  }
}
