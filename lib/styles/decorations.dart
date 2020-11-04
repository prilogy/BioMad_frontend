import 'package:biomad_frontend/styles/app_theme.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

import 'color_opacity.dart';

class Decorations {
  static InputDecoration input(BuildContext context) {
    final theme = Theme.of(context);

    var borderRadius = BorderRadius.all(Radius.circular(RadiusValues.less));

    return InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: theme.primaryColor, width: AppTheme.borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: theme.canvasColor, width: AppTheme.borderWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: theme.errorColor, width: AppTheme.borderWidth),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: theme.errorColor.withOpacity(ColorAlphas.a30),
              width: AppTheme.borderWidth),
        ),
        errorStyle: TextStyle(color: theme.errorColor));
  }
}
