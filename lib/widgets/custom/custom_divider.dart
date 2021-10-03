import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final EdgeInsetsGeometry textPadding;
  final double indent;
  final EdgeInsetsGeometry dividerPadding;
  final Color? color;

  CustomDivider(
      {this.text,
      this.color,
      this.indent = Indents.sm,
      this.dividerPadding = const EdgeInsets.only(top: Indents.sm),
      this.textPadding = const EdgeInsets.symmetric(horizontal: Indents.md)});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text != null
            ? Padding(
                padding: textPadding,
                child: Text(
                  text!.toUpperCase(),
                  style: TextStyle(color: theme.canvasColor),
                ),
              )
            : Container(),
        Padding(
          padding: dividerPadding,
          child: Divider(
            height: 1,
            color: color ?? theme.canvasColor,
          ),
        )
      ],
    );
  }
}
