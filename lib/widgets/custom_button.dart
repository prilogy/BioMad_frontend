import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/color_opacity.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

enum CustomButtonType {
  flat,
  raised,
  outlined,
}

class CustomButton extends StatelessWidget with IndentsMixin {
  final CustomButtonType type;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final IconData prependIcon;
  final IconData appendIcon;
  final double iconIndent;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double radius;

  CustomButton.raised(
      {@required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.text,
      this.appendIcon,
      this.padding,
      this.margin,
      this.radius = RadiusValues.less,
      this.iconIndent = Indents.md,
      this.prependIcon})
      : this.type = CustomButtonType.raised;

  CustomButton.flat(
      {@required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.text,
      this.appendIcon,
      this.padding,
      this.margin,
      this.radius = RadiusValues.less,
      this.iconIndent = Indents.md,
      this.prependIcon})
      : this.type = CustomButtonType.flat;

  CustomButton.outlined(
      {@required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.text,
      this.appendIcon,
      this.padding,
      this.margin,
      this.radius = RadiusValues.less,
      this.iconIndent = Indents.md,
      this.prependIcon})
      : this.type = CustomButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color tColor = textColor ?? null;
    Color bgColor = backgroundColor ?? null;
    if (tColor == null) {
      if (type == CustomButtonType.flat)
        tColor = theme.primaryColor;
      else if (type == CustomButtonType.raised)
        tColor = theme.colorScheme.onPrimary;
      else if (type == CustomButtonType.outlined) tColor = theme.primaryColor;
    }

    if (bgColor == null) {
      if (type == CustomButtonType.flat)
        bgColor = Colors.transparent;
      else if (type == CustomButtonType.raised)
        bgColor = theme.primaryColor;
      else if (type == CustomButtonType.outlined) bgColor = Colors.transparent;
    }

    final textWidget = Text(
      text.toUpperCase(),
      style: theme.textTheme.button
          .merge(TextStyle(color: tColor, fontWeight: FontWeight.w500)),
    );

    final body = Row(
      children: [
        if (prependIcon != null)
          Padding(
            padding: EdgeInsets.only(right: iconIndent),
            child: Icon(
              prependIcon,
              color: tColor,
            ),
          ),
        textWidget,
        if (appendIcon != null)
          Padding(
            padding: EdgeInsets.only(left: iconIndent),
            child: Icon(
              appendIcon,
              color: tColor,
            ),
          ),
      ],
    );

    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(
            color: type == CustomButtonType.outlined
                ? tColor
                : Colors.transparent));

    switch (type) {
      case CustomButtonType.raised:
        return withIndents(
          child: RaisedButton(
              splashColor: tColor.withOpacity(ColorAlphas.a30),
              hoverColor: tColor.withOpacity(ColorAlphas.a10),
              focusColor: tColor.withOpacity(ColorAlphas.a10),
              highlightColor: tColor.withOpacity(ColorAlphas.a10),
              onPressed: onPressed,
              child: body,
              color: bgColor,
              shape: shape),
        );
        break;
      case CustomButtonType.flat:
        return withIndents(
          child: FlatButton(
              splashColor: tColor.withOpacity(ColorAlphas.a30),
              hoverColor: tColor.withOpacity(ColorAlphas.a10),
              focusColor: tColor.withOpacity(ColorAlphas.a10),
              highlightColor: tColor.withOpacity(ColorAlphas.a10),
              onPressed: onPressed,
              child: body,
              color: bgColor,
              shape: shape),
        );
        break;
      case CustomButtonType.outlined:
        return withIndents(
          child: FlatButton(
              splashColor: tColor.withOpacity(ColorAlphas.a30),
              hoverColor: tColor.withOpacity(ColorAlphas.a10),
              focusColor: tColor.withOpacity(ColorAlphas.a10),
              highlightColor: tColor.withOpacity(ColorAlphas.a10),
              onPressed: onPressed,
              child: body,
              color: bgColor,
              shape: shape),
        );
        break;
    }
  }
}
