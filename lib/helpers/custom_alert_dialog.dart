import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

AlertDialog customAlertDialog(BuildContext context,
    {Widget child,
    String title,
    List<Widget> actions,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(Indents.md),
    EdgeInsetsGeometry titlePadding = const EdgeInsets.only(
        top: Indents.md, left: Indents.md, right: Indents.md,
    ), double contentHeight}) {
  final theme = Theme.of(context);

  return AlertDialog(
    scrollable: true,
    insetPadding: EdgeInsets.symmetric(horizontal: Indents.lg),
    content: Container(
      height: contentHeight ?? MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width,
      child: ScrollConfiguration(
          behavior: NoRippleScrollBehaviour(),
          child: ListView(children: [child])),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusValues.main)),
    titlePadding: titlePadding,
    contentPadding: contentPadding,
    title: Text(
      title,
      style: theme.textTheme.headline6,
    ),
    actions: actions,
  );
}
