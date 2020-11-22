import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

import 'biomarker_form_field.dart';

AlertDialog biomarkerAlertDialog(BuildContext context,
    {Widget child,
    String title,
    String hintBiomarker,
    String hintUnit,
    List<Widget> actions,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(Indents.md),
    EdgeInsetsGeometry titlePadding = const EdgeInsets.only(
      top: Indents.md,
      left: Indents.md,
      right: Indents.md,
    ),
    double contentHeight}) {
  final theme = Theme.of(context);

  return AlertDialog(
    scrollable: true,
    insetPadding: EdgeInsets.symmetric(horizontal: Indents.lg),
    content: Container(
      height: contentHeight ?? MediaQuery.of(context).size.height / 3 - 40,
      width: MediaQuery.of(context).size.width,
      child: ScrollConfiguration(
          behavior: NoRippleScrollBehaviour(),
          child: ListView(children: [
            Container(
                padding: EdgeInsets.only(
                    top: Indents.sm, left: Indents.md, right: Indents.md),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BiomarkerFormField(
                          controller: null,
                          validator: null,
                          labelText: "Биомаркер",
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SearchScreen(
                                      hintText:
                                          hintBiomarker ?? "Введите биомаркер");
                                });
                          }),
                      BiomarkerFormField(
                          controller: null,
                          validator: null,
                          labelText: "Значение",
                          onTap: () {}),
                      BiomarkerFormField(
                          controller: null,
                          validator: null,
                          margin: EdgeInsets.only(bottom: 0),
                          labelText: "Единицы измерения",
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SearchScreen(
                                      hintText: hintUnit ??
                                          "Введите единицу измерения");
                                });
                          }),
                    ]))
          ])),
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
