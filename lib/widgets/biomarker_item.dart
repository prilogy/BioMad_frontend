import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';

class BiomarkerItem extends StatelessWidget with IndentsMixin {
  final Widget child;
  final int id;
  final String name;
  final int value;
  final String unit;
  final String status;
  final TextStyle headerMergeStyle;
  final CrossAxisAlignment crossAxisAlignment;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry headerPadding;

  static const EdgeInsetsGeometry _defaultMargin =
      const EdgeInsets.only(bottom: Indents.md);

  BiomarkerItem(
      {this.child,
      this.id,
      this.name = "",
      this.value,
      this.unit = "",
      this.status = "",
      this.headerMergeStyle,
      this.headerPadding = const EdgeInsets.all(0),
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.padding = const EdgeInsets.symmetric(horizontal: Indents.md),
      this.margin = _defaultMargin});

  BiomarkerItem.forScrollingViews(
      {this.child,
      this.id,
      this.name,
      this.value,
      this.unit,
      this.status,
      this.headerMergeStyle,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.headerPadding = const EdgeInsets.only(left: Indents.md),
      this.padding = const EdgeInsets.all(0),
      this.margin = _defaultMargin});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Keys.rootNavigator.currentState
            .pushReplacementNamed(Routes.biomarker, arguments: id);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: Indents.smd,
        ),
        decoration: BoxDecoration(
          color: BioMadColors.base[100],
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: BioMadColors.base.withOpacity(0.06),
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Container(
                padding: EdgeInsets.all(Indents.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.subtitle1,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: 22.0,
                                color: BioMadColors.warning,
                              ),
                              Text(
                                  value.toString() + ' ' + unit + ', ' + status,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: BioMadColors.primary,
                      size: 24.0,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return biomarkerAlertDialog(
                            context,
                            title: "Изменить биомаркер",
                            actions: <Widget>[
                              TextButton(
                                child: Text('Отмена'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Изменить'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            //contentHeight: h,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: Indents.md),
                          );
                        },
                      );
                    },),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: BioMadColors.error,
                      size: 24.0,
                    ),
                    onPressed: null)
              ],
            )
          ],
        ),
      ),
    );
  }
}
